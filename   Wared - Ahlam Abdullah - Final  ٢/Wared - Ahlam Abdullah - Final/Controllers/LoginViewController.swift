//
//  LoginViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var btnEye: UIButton!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }
  
  
  func setUpElements() {
    // Style the elements
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(loginButton)
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
  }
  
  
  // MARK: -  @IBAction
  
  
  @IBAction func loginTapped(_ sender: Any) {
    
    // Create cleaned versions of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Signing in the user
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      
      if error != nil {
        // Couldn't sign in
        K.alertShow(title: "Error!".Localized(), Msg: error!.localizedDescription, context: self)
        
      } else {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
          self.present(vc!, animated: true, completion: nil)
        }
      }
    }
  }
  
  
  @IBAction func passwordToggle(_ sender: UIButton) {
    passwordTextField.isSecureTextEntry.toggle()
    
    if passwordTextField.isSecureTextEntry {
      btnEye.setImage(UIImage(systemName: K.ImagesName.eyeSlashFill),
                      for: .normal)
      
    } else {
      btnEye.setImage(UIImage(systemName: K.ImagesName.eyeFill), for: .normal)
      
    }
  }
  
}
