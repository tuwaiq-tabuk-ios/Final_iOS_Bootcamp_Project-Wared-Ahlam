//
//  Hospitals.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 30/05/1443 AH.
//

import Foundation
import UIKit

class Hospitals {
  
  var hlist = [HospitalStorage]()
  
  init(){
    
    
    hlist  = [HospitalStorage(lat: 24.714029, lng: 46.846966,
                              name: "King khaled Hospital".Localized(),
                              workingDays: "Sunday-Thursday".Localized(),
                              workingHours: "8 am - 1 pm", distance: "8 min",
                              image: UIImage(named: "Image")!),
              
              HospitalStorage(lat: 21.585207, lng: 39.177982,
                              name: "King Salman Hospital".Localized(),
                              workingDays: "Sunday-Thursday".Localized(),
                              workingHours: "8 am - 1 pm", distance: "10 min"
                              ,image: UIImage(named: "Image-2")!),
              
              HospitalStorage(lat: 26.310238, lng: 50.136944, name: "King Fahd Bin Sultan Hospital".Localized(),
                              workingDays: "Sunday-Thursday".Localized(),
                              workingHours: "8 am - 12 pm", distance: "12 min"
                              ,image: UIImage(named: "Image-1")!),
              
              HospitalStorage(lat: 24.156622, lng: 44.373131,
                              name: "Maternity and children hospital".Localized(), workingDays: "Sunday-Thursday".Localized(),
                              workingHours: "9 am - 12 pm", distance: "15 min",
                              image: UIImage(named: "Image-3")!)]
  }
}
