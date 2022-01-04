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
  
  @IBAction func loginTapped(_ sender: Any) {
    
    // Create cleaned versions of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Signing in the user
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      
      if error != nil {
        // Couldn't sign in
        Constants.alertShow(title: "Error!", Msg: error!.localizedDescription, context: self)
        
      }
      
      else {
        
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = story.instantiateViewController(identifier: Constants.Storyboard.homeViewControlle) as? HomeViewController{
          homeViewController.bloodType = SignupDataModel.bloodType
          homeViewController.city = SignupDataModel.cityName
          homeViewController.name = SignupDataModel.firstName + SignupDataModel.lastName
          homeViewController.modalPresentationStyle = .fullScreen
          self.present(homeViewController, animated: true, completion: nil)
        }
      }
    }
  }
  
  @IBAction func passwordToggle(_ sender: UIButton) {
    passwordTextField.isSecureTextEntry.toggle()
    
    if passwordTextField.isSecureTextEntry {
      btnEye.setImage(UIImage(systemName: Constants.ImagesName.eyeSlashFill),
                      for: .normal)
      
    } else {
      btnEye.setImage(UIImage(systemName: Constants.ImagesName.eyeFill), for: .normal)
      
    }
  }
  
}