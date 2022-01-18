//
//  CheckupVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 24/05/1443 AH.
//

import UIKit

class StartCheckingViewController: UIViewController {
  
  @IBOutlet weak var questionaboutCheck: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    questionaboutCheck.text = "These questions help you a lot in determining the ability to donate blood, and reduce your time and effort, and we will only take 30 seconds!".Localized()
    
  }
}
