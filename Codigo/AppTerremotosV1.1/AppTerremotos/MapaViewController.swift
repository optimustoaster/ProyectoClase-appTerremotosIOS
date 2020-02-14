//
//  MapaViewController.swift
//  AppTerremotos
//
//  Created by  on 14/02/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    var terremotoSeleccionado = terremoto()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Latitud: " + String(self.terremotoSeleccionado.getLatitud()))
        print("Longitud: " + String(self.terremotoSeleccionado.getLongitud()))
        
        
        //
        let locInicial = CLLocation(latitude: self.terremotoSeleccionado.getLatitud(), longitude: self.terremotoSeleccionado.getLongitud())
        
        centerMapOnLocation(location: locInicial)
        
        
        let anotacion = MKPointAnnotation()
        anotacion.coordinate = CLLocationCoordinate2DMake(self.terremotoSeleccionado.getLatitud(), self.terremotoSeleccionado.getLongitud())
        anotacion.title = self.terremotoSeleccionado.getLugar()
        mapView.addAnnotation(anotacion)
        
        // Do any additional setup after loading the view.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
