//
//  Contnue.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class Contnue: UIViewController {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  @IBAction func backButtin(_ sender: Any)
  {
    dismiss(animated: true, completion: nil)
  }
  
  
  func setUpElements() {
    
  
    errorLabel.alpha = 0
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleFilledButton(signUpButton)
    
  }
  
  
  func validateFields() -> String? {
    
    // Check that all fields are filled in
    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    {
      
      return "Please fill in all fields."
    }
    
    return nil
    
  }
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    // Validate the fields
    let error = validateFields()
    
    if error != nil {
      
      showError(error!)
    } else {
      
      // Create cleaned versions of the data
      let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let db = Firestore.firestore()
      db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName,
                                               ]) { (error) in
        
        if error != nil {
          // Show error message
          self.showError("Error saving user data")
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
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "NextVC")
    present(homeViewController!, animated: true, completion: nil)
    
  }
  
}
