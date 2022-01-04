//
//  User.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import Foundation

class User {
  
  var userId : String?
  var email : String?
  var firstName : String?
  var lastName : String?
  var bloodType : String?
  var cityName : String?
  var gender : String?
  var age : String?
  var weight : String?
  var donated : Int?
  
  init(userId : String,
       email : String,
       firstName : String,
       lastName : String,
       bloodType : String,
       cityName : String,
       gender : String,
       age : String,
       weight : String,
       donated : Int) {
    
    self.userId = userId
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.bloodType = bloodType
    self.cityName = cityName
    self.gender = gender
    self.age = age
    self.weight = weight
    self.donated  = donated
  }
  
  
  init(value : NSDictionary)
  {
    self.userId = (value["userId"] as! String)
    self.email = (value["email"] as! String)
    self.firstName = (value["firstName"] as! String)
    self.lastName = (value["lastName"] as! String)
    self.bloodType = (value["bloodType"] as! String)
    self.cityName = (value["cityName"] as! String)
    self.gender = (value["gender"] as! String)
    self.age = (value["age"] as! String)
    self.weight = (value["weight"] as! String)
    self.donated  = (value["donated"] as! Int)
    
  }
  
  
  func toDic() -> [String : Any] {
    
    var myDic = [String:String]()
    myDic["userId"] = self.userId
    myDic["email"] = self.email
    myDic["firstName"] = self.firstName
    myDic["lastName"] =  self.lastName
    myDic["bloodType"] = self.bloodType
    myDic["cityName"] =  self.cityName
    myDic["gender"] = self.gender
    myDic["age"] =  self.age
    myDic["weight"] = self.weight
    myDic["donated"] = String(self.donated!)
    
    return (myDic) as [String : Any]
    
  }
}

