//
//  ajustes.swift
//  AppTerremotos
//
//  Created by  on 07/02/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import Foundation

class ajustes{
    //private var url:String = ""
    private var listaSeleccionada = 0
    private var urlSeleccionada = 0
    private let urlUltimaHora = ["https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson",
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_hour.geojson",
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_hour.geojson",
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_hour.geojson"]
    private let urlUltimoDia = ["https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson",
                    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_day.geojson",
                    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson",
                    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson"]
    private let urlUltimaSemana = ["https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson",
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_week.geojson",
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojson",
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"]
    
    func getUrl() -> String{
        //return self.url
        let lista = getListaSeleccionada()
        return lista[self.urlSeleccionada]
    }
    
    func getListaUrlUltimaHora() -> [String]{
        return self.urlUltimaHora
    }
    
    func getListaUrlUltimoDia() -> [String]{
        return self.urlUltimoDia
    }
    
    func getListaUrlUltimaSemana() -> [String]{
        return self.urlUltimaSemana
    }
    
    func getListaSeleccionada() -> [String]{
        if listaSeleccionada == 0 {
            return self.urlUltimaHora
        }
        
        if listaSeleccionada == 1 {
            return self.getListaUrlUltimoDia()
        }else{
            return self.getListaUrlUltimaSemana()
        }
    }
    
    func setUrlSeleccionada(seleccion: Int){
        //let lista = getListaSeleccionada()
        //url = lista[seleccion]
        self.urlSeleccionada = seleccion
    }
    
    func setListaSeleccionada(seleccion: Int){
        self.listaSeleccionada = seleccion
    }
    
}
