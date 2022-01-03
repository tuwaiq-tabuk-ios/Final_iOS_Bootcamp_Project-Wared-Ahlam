//
//  SelectAgeVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 22/05/1443 AH.
//

import UIKit

class SelectAgeVC: UIViewController {
  
  @IBOutlet weak var datePicker: UIDatePicker!

  var ageMin : Date? , ageMax : Date?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Age of 18.
    ageMin = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    print("ageMin \(ageMin!)")
    // Age of 65.
    ageMax = Calendar.current.date(byAdding: .year, value: -65, to: Date())!
    print("ageMax \(ageMax!)")
    // Do any additional setup after loading the view.
  }
  
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func validateButtonPressed(_ sender: Any) {
    let isValidAge = validateAge(birthDate: datePicker.date);
    if isValidAge {
      SignupDataModel.age = datePicker.date.formatted()
      transitionToHome()
    } else {
      Constants.alertShow(title: "Invalid Age", Msg: "You must be over 18 old", context: self)
    }
  }
  

  func validateAge(birthDate: Date) -> Bool {
    var isValid: Bool = true
    if birthDate > ageMin! || birthDate < ageMax! {
      isValid = false
    }
    return isValid
  }
  
  
  
  func transitionToHome() {
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "EnterYourCityVC") as! EnterYourCityVC
    present(homeViewController, animated: true, completion: nil)
    
  }
}

