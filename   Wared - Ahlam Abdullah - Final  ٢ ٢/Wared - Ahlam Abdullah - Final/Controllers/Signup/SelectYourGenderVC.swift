//
//  SelectYourGenderVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class SelectYourGenderVC: UIViewController {
  
  @IBOutlet weak var backButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    backButton.setTitle("<".Localized(), for: .normal)
    // Do any additional setup after loading the view.
  }
  
  // MARK: - touchesBegan
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  // MARK: -  @IBAction
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func didSelectGender(_ sender: UIButton) {
    guard let gender = sender.currentTitle, !gender.isEmpty else { return }
    SignupDataModel.gender = gender
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectWeightVC")
    present(homeViewController!, animated: true, completion: nil)
  }
}
