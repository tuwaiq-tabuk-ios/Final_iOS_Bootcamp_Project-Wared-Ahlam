//
//  EnterEmailVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import Foundation
import Firebase
import FirebaseAuth

class EnterEmailVC: UIViewController {
  
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var contnueButton: UIButton!
  @IBOutlet weak var btnEye: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = ""
    setUpElements()
  }
  
  func setUpElements() {
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    
  }
  
  // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
  func validateFields() -> String? {
    
    // Check that all fields are filled in
    if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      
      return "Please fill in all fields."
//        .Localized()
      
    }
    
    // Check if the password is secure
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if Utilities.isPasswordValid(cleanedPassword) == false {
      // Password isn't secure enough
      return "Please make sure your password is at least 8 characters, contains a special character and a number.".Localized()
    }
    
    return nil
  }
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    guard let email = emailTextField.text, !email.isEmpty else {
      Constants.alertShow(title: "Error!".Localized(), Msg: validateFields()!, context: self)
      
      return
    }
    
    
    
    guard let password = passwordTextField.text, !password.isEmpty else { return}
    
    SignupDataModel.password = password
    SignupDataModel.email = email
    if !Utilities.isValidEmailAddress(email: email)
    {
      
      Constants.alertShow(title: "Error!".Localized(), Msg: "you Should enter a Valid Email".Localized(), context: self)
      
    } else {
      let homeViewController = storyboard?.instantiateViewController(withIdentifier: "EnterNameVC") as! EnterNameVC
      
      present(homeViewController, animated: true, completion: nil)
      
    }
  }
  
  @IBAction func passwordToggle(_ sender: UIButton) {
    passwordTextField.isSecureTextEntry.toggle()
    if passwordTextField.isSecureTextEntry
    {
      btnEye.setImage(UIImage(systemName: Constants.ImagesName.eyeSlashFill), for: .normal)
      
    } else {
      btnEye.setImage(UIImage(systemName: Constants.ImagesName.eyeFill), for: .normal)
    }
  }
}

