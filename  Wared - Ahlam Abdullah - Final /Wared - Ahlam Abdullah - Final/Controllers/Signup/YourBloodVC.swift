//
//  YorBloodVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class YourBloodVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.title = ""
    }
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
    
  @IBAction func didSelectBloodType(_ sender: UIButton) {
    guard let bloodType = sender.currentTitle, !bloodType.isEmpty else { return }
      SignupDataModel.bloodType = bloodType
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectYourGenderVC") as! SelectYourGenderVC
   
    present(homeViewController, animated: true, completion: nil)
  }
}
