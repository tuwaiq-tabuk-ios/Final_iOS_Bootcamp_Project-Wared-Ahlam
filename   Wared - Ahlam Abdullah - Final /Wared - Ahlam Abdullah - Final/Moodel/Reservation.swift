//
//  Reservation.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 02/06/1443 AH.
//

import UIKit

struct Reservation {
  
  var userId : String
  var hospitalName : String
  var date : String
  var time : String
  
  
  func toDic() -> [String : Any ] {
    
    return [
      "userId" : self.userId,
      "hospitalName":self.hospitalName,
      "date": self.date,
      "time" : self.time
    ]  as [String : Any ]
    
  }
}
