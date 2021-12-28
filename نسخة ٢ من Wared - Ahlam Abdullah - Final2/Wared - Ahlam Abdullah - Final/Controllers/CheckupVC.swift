//
//  CheckupVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 24/05/1443 AH.
//

import UIKit

class CheckupVC: UIViewController {

  @IBOutlet weak var QuestionaboutCheck: UILabel!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    QuestionaboutCheck.text = "These questions help you a lot in determining the ability to donate blood, and reduce your time and effort, and we will only take 30 seconds!"
        // Do any additional setup after loading the view.
    }
    
  @IBAction func buttonCheckup(_ sender: Any) {
    print(#function)
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Question") as! ImportantQuestionVC
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: false, completion: nil)
//    (vc!, animated: true)
  }
}
