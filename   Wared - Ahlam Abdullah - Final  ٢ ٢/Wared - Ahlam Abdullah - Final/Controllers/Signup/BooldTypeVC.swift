//
//  YorBloodVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class BooldTypeVC: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var backButton: UIButton!
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    backButton.setTitle("<".Localized(), for: .normal)
  }
  
  // MARK: - Methods
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  // MARK: -  @IBAction
  
  
  @IBAction func backButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func didSelectBloodType(_ sender: UIButton) {
    guard let bloodType = sender.currentTitle, !bloodType.isEmpty else { return }
    SignupDataModel.bloodType = bloodType
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "SelectYourGenderVC") as! SelectYourGenderVC
    
    present(homeViewController, animated: true, completion: nil)
  }
}
