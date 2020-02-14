//
//  ListaTableViewController.swift
//  AppTerremotos
//
//  Created by  on 31/01/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListaTableViewController: UITableViewController {

    var url:String = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
    var terremotos:[terremoto] = []
    var terremotoSeleccionado = terremoto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Pedimos el archivo (con AlamoFire) JSON a la url contenida en la configuracion
        self.cargarDatos()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func cargarDatos(){
        print("Limpiando datos anteriores ... ")
        self.terremotos.removeAll()
        print("Cargando datos de URL: " + self.url)
        Alamofire.request(self.url).responseJSON{ response in

            if let result = response.result.value {
                if let JSON = try? JSON(result){
                    
                    if !JSON["features"].isEmpty {
                        let datos = JSON["features"]
                        
                        // Hacemos un loop para sacar todos los datos
                        var contador: Int = 0
                        while !datos[contador]["properties"].isEmpty{
                            // Creamos un objeto de la clase terremoto, que añadimos a terremotos
                            var terremotoObj = terremoto()
                            
                            
                            // Guardamos el lugar
                            terremotoObj.setLugar(tmpLugar: datos[contador]["properties"]["place"].stringValue)
                            
                            // Guardamos la magnitud
                            terremotoObj.setMagnitud(tmpMagnitud: datos[contador]["properties"]["mag"].stringValue)
                            
                            // Guardamos la hora
                            terremotoObj.setHora(tmpHora: datos[contador]["properties"]["time"].doubleValue)
                            
                            // Guardamos la posibilidad de tsunami
                            terremotoObj.setTsunami(tmpTsunami: datos[contador]["properties"]["tsunami"].stringValue)
                            
                            // Guardamos el link a la web de USGS
                            terremotoObj.setLinkUsgs(link: datos[contador]["properties"]["url"].stringValue)
                            
                            // Enviamos la latitud y longitud para generar el link del Maps
                            terremotoObj.buildMapsLink(longitud: datos[contador]["geometry"]["coordinates"][0].stringValue, latitud: datos[contador]["geometry"]["coordinates"][1].stringValue)
                            
                            // Guardamos el objeto
                            self.terremotos.append(terremotoObj)
                            contador += 1
                        }
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
            
        }
    }
    
    @IBAction func buttonInAppMap(_ sender: UIButton) {
        var terremotoTmp = self.terremotos[sender.tag]
        
        // Obtenemos los datos
        self.terremotoSeleccionado = terremotoTmp
        
        //performSegue(withIdentifier: "mostrarTerremoto", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mostrarTerremoto"){
            var vc =  segue.destination as! MapaViewController
            vc.terremotoSeleccionado = self.terremotoSeleccionado
        }
    }
    
    
    
    @IBAction func actualizar(segue: UIStoryboardSegue){
        self.cargarDatos()
    }
    
    @IBAction func buttonMapa(_ sender: UIButton) {
        let directionsURL = self.terremotos[sender.tag].getLinkMaps()
        guard let url = URL(string: directionsURL) else {
            return
        }

        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
    @IBAction func actionButtonUsgs(_ sender: UIButton) {
        print("Abriendo \(self.terremotos[sender.tag].getLinkUsgs())")
        self.openBrowser(link: self.terremotos[sender.tag].getLinkUsgs())
    }
    
    func openBrowser(link: String){
        UIApplication.shared.open(URL(string: link)!)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return self.terremotos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath)as! TableViewCell
        
        // Configure the cell...
        cell.labelNombreSitio.text = terremotos[indexPath.row].getLugar()
        cell.labelValorMagnitud.text = terremotos[indexPath.row].getMagnitud()
        cell.labelValorHora.text = terremotos[indexPath.row].getHora()
        cell.labelValorPosibleTsunami.text = terremotos[indexPath.row].getTsunami()
        // Añadimos a los botones un tag con la row en la que estan para que
        // al clickarlos, se sepa que url coger de la lista de objetos.
        cell.buttonMaps.tag = indexPath.row
        cell.buttonUsgs.tag = indexPath.row
        cell.buttonInAppMap.tag = indexPath.row

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
