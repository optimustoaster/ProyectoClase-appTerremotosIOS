//
//  modeloTerremoto.swift
//  AppTerremotos
//
//  Created by  on 05/02/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import Foundation

class terremoto{
    
    private var lugar:String = "N/A"
    private var magnitud:String = "N/A"
    private var hora:String = "N/A"
    private var tsunami:String = "N/A"
    private var linkUsgs = ""
    private var linkMaps = ""
    private var latitud = 0.0
    private var longitud = 0.0

    func setLugar(tmpLugar:String){
        self.lugar = tmpLugar
    }
    
    func setMagnitud(tmpMagnitud:String) {
        self.magnitud = tmpMagnitud
    }
    
    func setHora(tmpHora:Double){
        // Convertimos el tiempo en unix a una fecha "normal"
        let tmp = tmpHora/1000
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        let date = Date(timeIntervalSince1970: tmp)
        let fechaFinal = dateFormatter.string(from: date)
        
        // Guardamos la fecha
        self.hora = fechaFinal
    }
    
    func setLinkUsgs(link:String){
        self.linkUsgs = link
    }
    
    func setTsunami(tmpTsunami:String){
        self.tsunami = tmpTsunami
    }
    
    func buildMapsLink(longitud:String, latitud:String){
        // https://www.google.com/maps/search/?api=1&query=36.26577,-92.54324
        // Latitud / Longitud
        self.linkMaps = "https://www.google.com/maps/search/?api=1&query=\(latitud),\(longitud)" //+ latitud + "," + longitud
        
        // Apaño temporal
        self.latitud = Double(latitud) as! Double
        self.longitud = Double(longitud) as! Double
        
    }
    
    func getLinkMaps() -> String{
        return self.linkMaps
    }
    
    func getLugar() -> String{
        return self.lugar
    }
    
    func getMagnitud() -> String{
        return self.magnitud
    }
    
    func getHora() -> String{
        return self.hora
    }
    
    func getTsunami() -> String{
        if self.tsunami == "1"{
            return "Si"
        }else if self.tsunami == "0"{
            return "No"
        }else{
            return self.tsunami
        }
    }
    
    func getLinkUsgs() -> String{
        return self.linkUsgs
    }
    
    func getLatitud() -> Double{
        return self.latitud
    }
    
    func getLongitud() -> Double{
        return self.longitud
    }
    
}
