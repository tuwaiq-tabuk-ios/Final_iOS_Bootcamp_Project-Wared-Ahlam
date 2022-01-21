//
//  StartCheckingViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 24/05/1443 AH.
//

import UIKit

class StartCheckingVC: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var questionaboutCheck: UILabel!
  
  
  // MARK: - View controller Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    questionaboutCheck.text = "These questions help you a lot in determining the ability to donate blood, and reduce your time and effort, and we will only take 30 seconds!".Localized()
  }
  
  // MARK: - @IBAction
  
  @IBAction func startCheck(_ sender: UIButton) {
    
    let story  = UIStoryboard(name: "Main", bundle: nil)
    if let next = story.instantiateViewController(withIdentifier: "Question") as? ImportantQuestionVC{
      self.navigationController?.pushViewController(next, animated: false)
      
    }
  }
}
