//
//  SelectWeightVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class SelectWeightVC: UIViewController {
  
  var data: SignupDataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  @IBAction func didSelectWeight(_ sender: UIButton) {
      guard let weight = sender.currentTitle, !weight.isEmpty else { return }
//      data.weight = weight
  }
  
  @IBAction func registerButton(_ sender: Any) {
    
    transitionToHome()
  }
  
  func transitionToHome() {
      
      let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewControlle)
      
      view.window?.rootViewController = homeViewController
      view.window?.makeKeyAndVisible()
      
}

}
