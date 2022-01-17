//
//  EnterEmailVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import Firebase
import FirebaseAuth
import UIKit


class EnterEmailVC: UIViewController {
  
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var contnueButton: UIButton!
  @IBOutlet weak var btnEye: UIButton!
  @IBOutlet weak var buttonEye: UIButton!
  @IBOutlet weak var retypePasswordText: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = ""
    setUpElements()
  }
  
  
  func setUpElements() {
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(retypePasswordText)
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
  }
  
  
  // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
  func validateFields() -> String? {
    
    // Check that all fields are filled in
    if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        retypePasswordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      
      return "Please fill in all fields.".Localized()
      //        .Localized()
    }
    // Check if the password is secure
    return nil
  }
  
  
  // MARK: -  @IBAction
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    guard let email = emailTextField.text, !email.isEmpty else {
      K.alertShow(title: "Error!".Localized(), Msg: validateFields()!, context: self)
      return
    }
    
    guard let password = passwordTextField.text, !password.isEmpty else { return }
    
    guard let retypePasswor = retypePasswordText.text, !password.isEmpty else { return }
    
    SignupDataModel.password = password
    SignupDataModel.email = email
    SignupDataModel.retypePassword = retypePasswor
    
  
    
    
    if !Utilities.isValidEmailAddress(email: email)
    {
      
      K.alertShow(title: "Error!".Localized(), Msg: "you Should enter a Valid Email".Localized(), context: self)
      
    } else if Utilities.isPasswordValid(password) == false {
      // Password isn't secure enough
      K.alertShow(title: "Error!".Localized(), Msg: "Please make sure your password is at least 8 characters, contains a special character and a number.".Localized(), context: self)
      
    } else if Utilities.isPasswordValidRetype(retypePasswor) == false {
    K.alertShow(title: "Error!".Localized(), Msg: "The password is different".Localized(), context: self)
      
      
    }else {
      let homeViewController = storyboard?.instantiateViewController(withIdentifier: "EnterNameVC") as! EnterNameVC
      
      present(homeViewController, animated: true, completion: nil)
      
    }
  }
  
  // MARK: -  @Eye

  @IBAction func passwordToggle(_ sender: UIButton) {
    passwordTextField.isSecureTextEntry.toggle()
    if passwordTextField.isSecureTextEntry
    {
      btnEye.setImage(UIImage(systemName: K.ImagesName.eyeSlashFill), for: .normal)
      
    } else {
      btnEye.setImage(UIImage(systemName: K.ImagesName.eyeFill), for: .normal)
    }
  }
  
  @IBAction func passwordRe(_ sender: Any) {
    
    retypePasswordText.isSecureTextEntry.toggle()
    if retypePasswordText.isSecureTextEntry
    {
      buttonEye.setImage(UIImage(systemName: K.ImagesName.eyeSlashFill), for: .normal)
      
    } else {
      buttonEye.setImage(UIImage(systemName: K.ImagesName.eyeFill), for: .normal)
    }
  }
}

