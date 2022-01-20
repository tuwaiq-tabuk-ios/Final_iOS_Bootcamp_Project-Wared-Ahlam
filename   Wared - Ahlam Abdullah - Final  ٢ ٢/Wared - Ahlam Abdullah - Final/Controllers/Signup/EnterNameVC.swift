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
  @IBOutlet weak var backButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
    self.title = ""
    backButton.setTitle("<".Localized(), for: .normal)
  }
  
  // MARK: - touchesBegan
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  
  func setUpElements() {
    
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    
  }
  
  // MARK: - validateFields
  
  func validateFields() -> String? {
    
    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    {
      
      return "Please fill in all fields.".Localized()
    }
    return nil
  }
  
  // MARK: -  @IBAction
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    guard let firstName = firstNameTextField.text , !firstName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        K.alertShow(title: "Error!".Localized(), Msg: error!, context: self)
      }
      return
    }
    
    guard let lastName = lastNameTextField.text , !lastName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        K.alertShow(title: "Error!".Localized(), Msg: error!, context: self)
      }
      return
    }
    
    SignupDataModel.firstName = firstName
    SignupDataModel.lastName = lastName
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectAgeVC") as! SelectAgeVC
    
    present(homeViewController, animated: true, completion: nil)
    
  }
}
