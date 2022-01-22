//
//  LoginViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class EnterNameVC: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var backButton: UIButton!
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    backButton.setTitle("<".Localized(),
                        for: .normal)
  }
  
  // MARK: - Methods
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  
  func validateFields() -> String? {
    
    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    {
      return "Please fill in all fields.".Localized()
    }
    return nil
  }
  
  // MARK: -  @IBAction
  
  
  @IBAction func backButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func signUpTapped(_ sender: UIButton) {
    
    guard let firstName = firstNameTextField.text
            , !firstName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        K.alertShow(title: "Error!".Localized(),
                    Msg: error!,
                    context: self)
      }
      return
    }
    
    guard let lastName = lastNameTextField.text ,
            !lastName.isEmpty else {
      let error = validateFields()
      
      if error != nil {
        K.alertShow(title: "Error!".Localized(),
                    Msg: error!,
                    context: self)
      }
      return
    }
    
    SignupDataModel.firstName = firstName
    SignupDataModel.lastName = lastName
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectAgeVC") as! SelectAgeVC
    
    present(homeViewController, animated: true, completion: nil)
    
  }
}
