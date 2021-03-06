//
//  SelectAgeVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 22/05/1443 AH.
//

import UIKit

class SelectAgeVC: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var backButton: UIButton!
  
  // MARK: - Properties
  
  var ageMin : Date? , ageMax : Date?
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Age of 18.
    ageMin = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    print("ageMin \(ageMin!)")
    // Age of 65.
    ageMax = Calendar.current.date(byAdding: .year, value: -65, to: Date())!
    print("ageMax \(ageMax!)")
    // Do any additional setup after loading the view.
    backButton.setTitle("<".Localized(), for: .normal)
  }
  
  // MARK: - Methods
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  
  func validateAge(birthDate: Date) -> Bool {
    var isValid: Bool = true
    if birthDate > ageMin! || birthDate < ageMax! {
      isValid = false
    }
    return isValid
  }
  
  
  // MARK: -  @IBAction
  
  
  @IBAction func backButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func validateButtonPressed(_ sender: UIButton) {
    let isValidAge = validateAge(birthDate: datePicker.date);
    if isValidAge {
      SignupDataModel.age = datePicker.date.formatted()
      
      let homeViewController = storyboard?.instantiateViewController(withIdentifier: "EnterYourCityVC") as! EnterYourCityVC
      present(homeViewController, animated: true, completion: nil)
      
    } else {
      K.alertShow(title: "Invalid Age".Localized(), Msg: "You must be over 18 old".Localized(), context: self)
    }
  }
  
}
