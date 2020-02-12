//
//  ViewController.swift
//  AppTerremotos
//
//  Created by  on 24/01/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet weak var selectorMomento: UISegmentedControl!
    //@IBOutlet weak var selectorMagnitud: UISegmentedControl!
    private var momento = ""
    private var urls = ajustes()
    
    @IBAction func selectorMomento(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            urls.setListaSeleccionada(seleccion: 0)
        }else if sender.selectedSegmentIndex == 1{
            urls.setListaSeleccionada(seleccion: 1)
        }else{
            urls.setListaSeleccionada(seleccion: 2)
        }
        
    }
    
    @IBAction func selectorIntensidad(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            urls.setUrlSeleccionada(seleccion: 0)
        }else if sender.selectedSegmentIndex == 1{
            urls.setUrlSeleccionada(seleccion: 1)
        }else if sender.selectedSegmentIndex == 2{
            urls.setUrlSeleccionada(seleccion: 2)
        }else{
            urls.setUrlSeleccionada(seleccion: 3)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        urls.setListaSeleccionada(seleccion: 0)
        urls.setUrlSeleccionada(seleccion: 0)
    }
    
    @IBAction func buttonGuardarAjustes(_ sender: Any) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){// Todo: FIX
    if (segue.identifier == "guardarSettings"){
        let vc = segue.destination as! ListaTableViewController
        vc.url =  self.urls.getUrl()
    }
    
    }
    
}

