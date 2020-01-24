//
//  ViewController.swift
//  AppTerremotos
//
//  Created by  on 24/01/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    var url:String = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // Pedimos el archivo (con AlamoFire) JSON a la url contenida en la configuracion
        Alamofire.request(self.url).responseJSON{ response in

            if let result = response.result.value {
                if let JSON = try? JSON(result){
                    var test = JSON["features"][0]["properties"]["place"].string!
                    
                    
                    print("Test While")
                    var contador: Int = 0
                    while !JSON["features"][contador]["properties"].isEmpty{
                            //print(contador)
                            print(JSON["features"][contador]["properties"]["place"].string!)
                            contador += 1

                    }
                    
                }
            }
            
        }
        
    }


}

