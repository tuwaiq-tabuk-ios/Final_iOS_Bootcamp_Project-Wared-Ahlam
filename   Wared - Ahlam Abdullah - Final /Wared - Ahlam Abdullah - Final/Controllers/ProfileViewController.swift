//
//  ProfileViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//


import UIKit
import Firebase

class ProfileViewController: UIViewController {
  
  
  @IBOutlet weak var personalData: UILabel!
  @IBOutlet weak var logOffLocalize: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var bloodType: UILabel!
  @IBOutlet weak var donatedLabel: UILabel!
  @IBOutlet weak var emileLocalize: UILabel!
  @IBOutlet weak var nameLocalize: UILabel!
  @IBOutlet weak var bloodLocalize: UILabel!
  @IBOutlet weak var donatedLocalize: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = Constants.UserData.name
    emailLabel.text = Constants.UserData.email
    bloodType.text = Constants.UserData.bloodType
    donatedLabel.text = Constants.UserData.donation
    emileLocalize.text = "Emile".Localized()
    nameLocalize.text = "Name".Localized()
    bloodLocalize.text = "blood type".Localized()
    donatedLocalize.text = "Donated".Localized()
    personalData.text = "personal date".Localized()
    logOffLocalize.setTitle("Logoff".Localized(), for: .normal)
    
  }
  
  // MARK: -  @IBAction

  @IBAction func btnLogOutTapped(_ sender: Any) {
    
    try? Auth.auth().signOut()
    let story = UIStoryboard(name: "Main", bundle: nil)
    if let next = story.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
      next.modalPresentationStyle = .fullScreen
      self.present(next, animated: true, completion: nil)
    }
  }
}
