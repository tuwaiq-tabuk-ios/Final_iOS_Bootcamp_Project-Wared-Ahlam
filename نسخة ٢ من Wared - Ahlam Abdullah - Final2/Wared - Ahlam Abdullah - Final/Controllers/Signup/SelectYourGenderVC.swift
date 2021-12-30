//
//  SelectYourGenderVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class SelectYourGenderVC: UIViewController {
  

  var data: SignupDataModel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func didSelectGender(_ sender: UIButton) {
    guard let gender = sender.currentTitle, !gender.isEmpty else { return }
//    data.gender = gender
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectWeightVC")
    present(homeViewController!, animated: true, completion: nil)
//    vc.data = data
  }
}
