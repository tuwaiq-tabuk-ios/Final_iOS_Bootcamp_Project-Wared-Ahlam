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
  
  
  static func alertShow(title : String , Msg : String,context : UIViewController) {
    
    let alert = UIAlertController(title: title,
                                  message: Msg,
                                  preferredStyle:
                                      .alert)
    
    let dismiss = UIAlertAction(title: "Dismiss",
                                style: .destructive)
    
    alert.addAction(dismiss)
    
    context.present(alert, animated: true, completion: nil)
    
  }
//
  typealias handler = (_ result : String,_ error :Bool)-> Void
  
  static func alertShow(title : String , Msg : String,context : UIViewController ,callBack:@escaping handler)
 
  {
    var action = ""
    let alert = UIAlertController(title: title,
                                  message: Msg, preferredStyle:
                                      .alert)
    
    let Dismiss = UIAlertAction(title: "Dismiss", style: .cancel) {  DismissAction in
      
      action = "Dismiss"
      print(action)
      callBack(action,false)
    }
    
    alert.addAction(Dismiss)
    
    context.present(alert, animated: true) {
      
      print("Alert Start")
    }
  }
}
