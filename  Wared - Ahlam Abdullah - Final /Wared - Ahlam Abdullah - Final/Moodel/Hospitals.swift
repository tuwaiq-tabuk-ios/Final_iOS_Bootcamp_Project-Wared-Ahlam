//
//  Hospitals.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 30/05/1443 AH.
//

import Foundation
class Hospitals {
  var hlist = [HospitalModel]()
  
  init(){
    
    hlist  = [HospitalModel(lat: 24.714029, lng: 46.846966, name: "King khaled Hospital", workingDays: "Sunday-Thursday", workingHours: "8 am - 1 pm", distance: "8 min"),
              
              HospitalModel(lat: 21.585207, lng: 39.177982, name: "King Salman Hospital", workingDays: "Sunday-Thursday", workingHours: "8 am - 1 pm", distance: "10 min"),
              
              HospitalModel(lat: 26.310238, lng: 50.136944, name: "King Fahd Bin Sultan Hospital", workingDays: "Sunday-Thursday", workingHours: "8 am - 12 pm", distance: "12 min"),
              
              HospitalModel(lat: 24.156622, lng: 44.373131, name: "Maternity and children hospital", workingDays: "Sunday-Thursday", workingHours: "9 am - 12 pm", distance: "15 min")]
  }
}
