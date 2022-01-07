//
//  LoginViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class EnterNameVC
: UIViewController {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  //  @IBOutlet weak var errorLabel: UILabel!
  
  
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpElements()
    self.title = ""
    
  }
  
  func setUpElements() {
    
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
  }
  
  func validateFields() -> String? {
    
    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    {
      
      return "Please fill in all fields.".Localized()
    }
    return nil
  }
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    guard let firstName = firstNameTextField.text , !firstName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        Constants.alertShow(title: "Error!".Localized(), Msg: error!, context: self)
      }
      return
    }
    guard let lastName = lastNameTextField.text , !lastName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        Constants.alertShow(title: "Error!".Localized(), Msg: error!, context: self)
      }
      return
    }
    
    SignupDataModel.firstName = firstName
    SignupDataModel.lastName = lastName
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectAgeVC") as! SelectAgeVC
    
    present(homeViewController, animated: true, completion: nil)
    
  }
}
