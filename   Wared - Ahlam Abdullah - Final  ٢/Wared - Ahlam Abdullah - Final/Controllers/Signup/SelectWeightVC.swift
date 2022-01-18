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
  
  @IBOutlet weak var lessThan50View: UIView!
  @IBOutlet weak var moraThan50View: UIView!
  @IBOutlet weak var backButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.title = ""
    backButton.setTitle("<".Localized(), for: .normal)
  }
  
  //
  //  func transitionToHome() {
  //
  //    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
  //    vc?.modalPresentationStyle = .fullScreen
  //    vc?.modalTransitionStyle = .crossDissolve
  //    DispatchQueue.main.async {
  //      self.present(vc!, animated: true, completion: nil)
  //    }
  //
  //  }
  //
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  // MARK: -  @IBAction
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func didSelectWeight(_ sender: UIButton) {
    guard let weight = sender.currentTitle, !weight.isEmpty else { return }
    if sender.currentTitle == "over".Localized() {
      moraThan50View.backgroundColor  = #colorLiteral(red: 0.4156862745, green: 0, blue: 0, alpha: 1)
      lessThan50View.backgroundColor = UIColor.clear
    } else if sender.currentTitle == "less".Localized() {
      lessThan50View.backgroundColor  = #colorLiteral(red: 0.4156862745, green: 0, blue: 0, alpha: 1)
      moraThan50View.backgroundColor = UIColor.clear
    }
    
    SignupDataModel.weight = weight
  }
  
  
  @IBAction func registerButton(_ sender: Any) {
    if SignupDataModel.weight.isEmpty {
      K.alertShow(title: "Error".Localized(), Msg: "You have to choose the weight".Localized(), context: self)
      return
    }
    
    Auth.auth().createUser(withEmail: SignupDataModel.email, password: SignupDataModel.password) { (result, error) in
      if error != nil {
        K.alertShow(title: "Error!".Localized(), Msg: error.debugDescription, context: self)
        
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
            K.alertShow(title: "Error!", Msg: error.debugDescription, context: self)
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
    }
  }
}
