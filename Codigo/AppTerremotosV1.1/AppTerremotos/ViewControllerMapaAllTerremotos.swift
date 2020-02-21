//
//  ViewControllerMapaAllTerremotos.swift
//  AppTerremotos
//
//  Created by  on 21/02/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMapaAllTerremotos: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var terremotos: [terremoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for terremotoTmp in terremotos{
            print("Latitud: " + String(terremotoTmp.getLatitud()))
            print("Longitud: " + String(terremotoTmp.getLongitud()))
        
        //
            let locInicial = CLLocation(latitude: terremotoTmp.getLatitud(), longitude: terremotoTmp.getLongitud())
        
            centerMapOnLocation(location: locInicial)
        
        
            let anotacion = MKPointAnnotation()
            anotacion.coordinate = CLLocationCoordinate2DMake(terremotoTmp.getLatitud(), terremotoTmp.getLongitud())
            anotacion.title = terremotoTmp.getLugar()
            mapView.addAnnotation(anotacion)
        }
    }
    
        let regionRadius: CLLocationDistance = 1000000
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
