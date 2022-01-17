//
//  ImportantQuestionVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 24/05/1443 AH.
//

import UIKit

class ImportantQuestionVC: UIViewController {
  
  @IBOutlet weak var questionImageView: UIImageView!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var qusetionLabel: UILabel!
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  
  var selectedIndex = 0
  var questions = QuestionList()
  var question : QuestionModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    containerView.layer.cornerRadius = 8
    containerView.clipsToBounds = true
    yesButton.layer.cornerRadius = 20
    yesButton.clipsToBounds = true
    noButton.layer.cornerRadius = 20
    noButton.clipsToBounds = true
    self.title = ""
    getCurrentQuestion()
    
  }
  
  
  func getCurrentQuestion() {
    question = self.questions.qlist[selectedIndex]
    qusetionLabel.text = question!.question
    questionImageView.image = UIImage(named: question!.image)
    
  }
  
  // MARK: -  @IBAction

  
  @IBAction func answerButtonPresswd(_ sender: UIButton) {
    
    let story = UIStoryboard(name: "Main", bundle: nil)
    if sender.titleLabel?.text! == "لا" || sender.titleLabel?.text! ==  "No"
    {
      selectedIndex += 1
      if selectedIndex < self.questions.qlist.count {
        
        getCurrentQuestion()
        
      } else {
        
        if let next = story.instantiateViewController(withIdentifier: "BookAppointmentViewController") as? BookAppointmentViewController{
          next.modalPresentationStyle = .fullScreen
          self.present(next, animated: true, completion: nil)
        }
      }
      
    } else {
      K.alertShow(title: "Sorry!".Localized(), Msg: "You cann't Donnate now try in a nother time.".Localized(), context: self) { result, error in
        if  error == false
        {
          if let next = story.instantiateViewController(withIdentifier: K.Storyboard.homeViewControlle) as? HomeViewController{
            next.modalPresentationStyle = .fullScreen
            self.present(next, animated: true, completion: nil)
          }
          
        }
        
      }
      
    }
    
  }
  
}

