//
//  Constants.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit

struct Constants {

  struct Storyboard {
    
    static let homeViewControlle = "HomeController"
    
  }
  
  
  struct ImagesName {
    
    static let eyeSlashFill = "eye.slash.fill"
    static let eyeFill = "eye.fill"
    
  }
  
  
  struct UserData {
    
    static var userId = ""
    static var name = ""
    static var bloodType = ""
    static var email = ""
    static var donation = ""
    static  var city = ""
  
  }
  
  
  struct R {
    static var hospitalIndex = 0
  }
  
  
  struct Collections {
    static let reservations = "Reservations"
    static let users = "users"
  }
  
  
  // MARK: -  alertShow

  static func alertShow(title : String , Msg : String,context : UIViewController) {
    
    let alert = UIAlertController(title: title,
                                  message: Msg,
                                  preferredStyle:
                                      .alert)
    
    let close = UIAlertAction(title: "Close".Localized(),
                                style: .destructive)
    
    alert.addAction(close)
    
    context.present(alert, animated: true, completion: nil)
    
  }
  
  
  typealias handler = (_ result : String,_ error :Bool)-> Void
  
  static func alertShow(title : String , Msg : String,context : UIViewController ,callBack:@escaping handler) {
    
    var action = ""
    let alert = UIAlertController(title: title,
                                  message: Msg, preferredStyle:
                                      .alert)
    
    let close = UIAlertAction(title: "Close".Localized(), style: .cancel) {  dismissAction in
      
      action = "Close".Localized()
      print(action)
      callBack(action,false)
    }
    
    
    alert.addAction(close)
    
    context.present(alert, animated: true) {
      
      print("Alert Start")
    }
  }
}
