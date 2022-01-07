//
//  ProfileViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//


import UIKit
import Firebase

class ProfileViewController: UIViewController {
  
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var emailLabel: UILabel!
  
  
  @IBOutlet weak var bloodType: UILabel!
  
  
  @IBOutlet weak var donatedLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = Constants.UserData.name
    emailLabel.text = Constants.UserData.email
    bloodType.text = Constants.UserData.bloodType
    donatedLabel.text = Constants.UserData.donation
    
  }
  
  
  @IBAction func btnLogOutTapped(_ sender: Any) {
    
    try? Auth.auth().signOut()
    let story = UIStoryboard(name: "Main", bundle: nil)
    if let next = story.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
      next.modalPresentationStyle = .fullScreen
      self.present(next, animated: true, completion: nil)
    }
  }
}
