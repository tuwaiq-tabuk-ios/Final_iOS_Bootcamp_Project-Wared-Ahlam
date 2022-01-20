//
//  ViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var loginButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    signUpButton.setTitle("Sign Up".Localized(), for: .normal)
    loginButton.setTitle("Login".Localized(), for: .normal)
    setUpElements()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - setUpElements
  func setUpElements() {
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
  }
}


