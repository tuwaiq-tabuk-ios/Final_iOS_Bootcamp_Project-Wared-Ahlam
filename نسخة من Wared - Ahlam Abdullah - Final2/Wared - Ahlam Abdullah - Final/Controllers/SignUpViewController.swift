//
//  SignUpViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import Foundation
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var contnueButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpElements()
  }
  
  func setUpElements() {
    
    errorLabel.alpha = 0
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(contnueButton)
    
  }
  
  // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
  func validateFields() -> String? {
    
    // Check that all fields are filled in
    if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      
      return "Please fill in all fields."
    }
    
    // Check if the password is secure
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if Utilities.isPasswordValid(cleanedPassword) == false {
      // Password isn't secure enough
      return "Please make sure your password is at least 8 characters, contains a special character and a number."
    }
    
    return nil
  }
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    // Validate the fields
    let error = validateFields()
    
    if error != nil {
      
      // There's something wrong with the fields, show error message
      showError(error!)
    }
    else {
      
      // Create cleaned versions of the data
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // Create the user
      Auth.auth().createUser(withEmail: email, password: password) { [self] (result, err) in
        
        // Check for errors
        if err != nil {
          
          
        }
        else {
          
          // User was created successfully, now store the first name and last name
          let db = Firestore.firestore()
          
          
        }
      }
      transitionToHome()
      
    }
  }
  
  func showError(_ message:String) {
    
    errorLabel.text = message
    errorLabel.alpha = 1
    
  }

  func transitionToHome() {
    
   
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "ContnueVC")
    present(homeViewController!, animated: true, completion: nil)
   
    
  }
  
}
