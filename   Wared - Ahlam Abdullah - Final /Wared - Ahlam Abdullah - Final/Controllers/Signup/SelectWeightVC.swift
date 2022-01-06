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
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.title = ""
  }
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func didSelectWeight(_ sender: UIButton) {
    guard let weight = sender.currentTitle, !weight.isEmpty else { return }
    SignupDataModel.weight = weight
  }
  
  
  @IBAction func registerButton(_ sender: Any) {
    
    Auth.auth().createUser(withEmail: SignupDataModel.email, password: SignupDataModel.password) { (result, error) in
      if error != nil {
        Constants.alertShow(title: "Error!".Localized(), Msg: error.debugDescription, context: self)
        
      } else {
        
        let db = Firestore.firestore()
        let user = User(userId: result!.user.uid,
                        email: SignupDataModel.email,
                        firstName: SignupDataModel.firstName,
                        lastName: SignupDataModel.lastName,
                        bloodType: SignupDataModel.bloodType,
                        cityName: SignupDataModel.cityName,
                        gender: SignupDataModel.gender,
                        age: SignupDataModel.age,
                        weight: SignupDataModel.weight,
                        donated: 0)
        
        db.collection("users").document("\(result!.user.uid)").setData(user.toDic()) { (error) in
          if error != nil {
            Constants.alertShow(title: "Error!", Msg: error.debugDescription, context: self)
          } else {
            self.transitionToHome()
          }
          
        }
      }
    }
  }
  
  func transitionToHome() {
    
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
    vc?.modalPresentationStyle = .fullScreen
    vc?.modalTransitionStyle = .crossDissolve
    DispatchQueue.main.async {
      self.present(vc!, animated: true, completion: nil)
    }
    
  }
  
}


