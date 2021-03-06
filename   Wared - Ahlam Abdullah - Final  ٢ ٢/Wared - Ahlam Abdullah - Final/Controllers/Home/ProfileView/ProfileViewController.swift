//
//  ProfileViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//


import UIKit
import Firebase

class ProfileViewController: UIViewController {
  
  //MARK: - IBOutlets
  
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
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = K.UserData.name
    emailLabel.text = K.UserData.email
    bloodType.text = K.UserData.bloodType
    donatedLabel.text = "\(K.UserData.donation)"
    emileLocalize.text = "Emile".Localized()
    nameLocalize.text = "Name".Localized()
    bloodLocalize.text = "blood type".Localized()
    donatedLocalize.text = "Donated".Localized()
    personalData.text = "personal date".Localized()
    logOffLocalize.setTitle("Logoff".Localized(), for: .normal)
    
  }
  
  // MARK: -  @IBAction
  
  @IBAction func btnLogOutTapped(_ sender: UIButton) {
    
    try? Auth.auth().signOut()
    let story = UIStoryboard(name: "Main", bundle: nil)
    if let next = story.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
      next.modalPresentationStyle = .fullScreen
      self.present(next, animated: true, completion: nil)
    }
  }
}
