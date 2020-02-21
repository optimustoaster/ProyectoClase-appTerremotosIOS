//
//  ViewController.swift
//  AppTerremotos
//
//  Created by  on 24/01/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectorMomento: UISegmentedControl!
    @IBOutlet weak var selectorMagnitud: UISegmentedControl!
    private var momento = 0
    private var urls = ajustes()
    private let defaults = UserDefaults.standard
    
    @IBAction func selectorMomento(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            urls.setListaSeleccionada(seleccion: 0)
            self.defaults.set(0, forKey: "momento")
        }else if sender.selectedSegmentIndex == 1{
            urls.setListaSeleccionada(seleccion: 1)
            self.defaults.set(1, forKey: "momento")
        }else{
            urls.setListaSeleccionada(seleccion: 2)
            self.defaults.set(2, forKey: "momento")
        }
        
    }
    
    @IBAction func selectorIntensidad(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            urls.setUrlSeleccionada(seleccion: 0)
            self.defaults.set(0, forKey: "magnitud")
        }else if sender.selectedSegmentIndex == 1{
            urls.setUrlSeleccionada(seleccion: 1)
            self.defaults.set(1, forKey: "magnitud")
        }else if sender.selectedSegmentIndex == 2{
            urls.setUrlSeleccionada(seleccion: 2)
            self.defaults.set(2, forKey: "magnitud")
        }else{
            urls.setUrlSeleccionada(seleccion: 3)
            self.defaults.set(3, forKey: "magnitud")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.selectorMomento.selectedSegmentIndex = self.defaults.integer(forKey: "momento")
        self.selectorMagnitud.selectedSegmentIndex = self.defaults.integer(forKey: "magnitud")
    }
    
    @IBAction func buttonGuardarAjustes(_ sender: Any) {
        self.defaults.set(self.urls.getUrl(), forKey: "url")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    if (segue.identifier == "guardarSettings"){
        let vc = segue.destination as! ListaTableViewController
        vc.url =  self.urls.getUrl()
    }
    
    }
    
}

