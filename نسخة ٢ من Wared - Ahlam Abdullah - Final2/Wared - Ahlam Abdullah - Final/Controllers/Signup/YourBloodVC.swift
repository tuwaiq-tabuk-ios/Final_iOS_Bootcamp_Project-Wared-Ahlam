//
//  YorBloodVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class YourBloodVC: UIViewController {
  var data: SignupDataModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
    // Do any additional setup after loading the view.
    }
    
  @IBAction func didSelectBloodType(_ sender: UIButton) {
    guard let bloodType = sender.currentTitle, !bloodType.isEmpty else { return }
//    data.bloodType = bloodType
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectYourGenderVC")
    present(homeViewController!, animated: true, completion: nil)
  }
}
