//
//  HomeViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
  
  
  @IBOutlet weak var Donatebtn: UIButton!
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var bloodTypeLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  
  var name : String = ""
  var city : String = ""
  var bloodType : String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    messageLabel.text = "Our records indicate that you haven't donated yet. Do Good!"
    let db = Firestore.firestore()
    db.collection("users").document(FirebaseAuth.Auth.auth().currentUser!.uid).getDocument(source: .cache) { Document, error in
      
      if let doc = Document{
        doc.data().map { wrapped in
          self.name =   wrapped["firstName"] as! String
          self.city = wrapped["cityName"] as! String
          self.bloodType =  wrapped["bloodType"] as! String
          if let donated = wrapped["donated"] as? String{
            self.Donatebtn.setTitle("Donations \(donated)", for: .normal)
          }
          
          
          self.nameLabel.text = self.name
          self.cityLabel.text = self.city
          self.bloodTypeLabel.text = self.bloodType
          
        }
        
      }
    }
  }
  
  
  @IBAction func donationButton(_ sender: Any) {
  }
  
  
  @IBAction func didAppointmentMap(_ sender: Any) {
    
    print("action Start")
    let story = UIStoryboard(name: "Main", bundle: nil)
    if let vc = story.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController{
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true, completion: nil)
    }
    
  }
}
