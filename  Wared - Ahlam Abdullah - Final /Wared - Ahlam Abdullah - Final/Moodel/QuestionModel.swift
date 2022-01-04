//
//  QuestionModel.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import Foundation

struct QuestionModel {
  var question: String
  var answers: [AnswerModel]
  var proccedAnswer : String
  var image : String
  
}

struct AnswerModel {
  
  var answer : String
}


class QuestionList
{
  var qlist = [QuestionModel]()
  
  init() {
    
    self.qlist.append(QuestionModel(question:"Do you have a fever or a symptom of a respiratory illness or have you taken an antibiotic in the previous 10 days?",
                                    answers: [AnswerModel(answer: "Yes"),
                                              AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "5.png"))
    
    self.qlist.append(QuestionModel(question: "Have you taken aspirin within the previous 48 hours?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer:"No")],
                                    proccedAnswer: "No", image: "3.png"))
    
    self.qlist.append(QuestionModel(question: "Have you donated blood in the past 60 days?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "1-1.png"))
    
    self.qlist.append(QuestionModel(question: "Has surgery been performed within the previous 12 months?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "4.png"))
    self.qlist.append(QuestionModel(question: "In the previous 12 months, have you been accidentally pricked with a needle, using cosmetic needles, or had cupping, tattooing or ear piercing?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "4.png"))
    
    self.qlist.append(QuestionModel(question: "Have you traveled outside the Kingdom in the previous 28 days?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "6.png"))
    
    self.qlist.append(QuestionModel(question: "Were you infected with the Corona virus during the past month, or suspected of infection, or close to an infected person?",
                                    answers: [AnswerModel(answer: "Yes"),AnswerModel(answer: "No")],
                                    proccedAnswer: "No", image: "7.png"))
  }
}
