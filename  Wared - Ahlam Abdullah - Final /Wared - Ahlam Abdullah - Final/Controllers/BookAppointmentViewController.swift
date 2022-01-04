//
//  BookAppointmentViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 27/05/1443 AH.
//

import UIKit

class BookAppointmentViewController: UIViewController {
  
  @IBOutlet weak var selectDateView: UIView!
  
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var hospitalNameLabel: UILabel!
  
  @IBOutlet weak var distanceLabel: UILabel!
  
  @IBOutlet weak var workingDaysLabel: UILabel!
  
  @IBOutlet weak var workingHoursLabel: UILabel!
  
  @IBOutlet weak var selectDateTextField: UITextField!
  
  @IBOutlet weak var selectTimeTextField: UITextField!
  
  
  let datePicker = UIDatePicker()
  let timePicker = UIDatePicker()
  
  //  var hospital: HospitalModel =  HospitalModel(lat: 24.056341, lng: 43.087730, name: "King khaled", workingDays: "Sunday-Thursday", workingHours: "8 am - 9 pm", distance: "45 min")
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerView.layer.cornerRadius = 8
    containerView.layer.borderWidth = 1
    containerView.layer.borderColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.92)
    containerView.clipsToBounds = true
    
    selectDateView.layer.cornerRadius = 8
    selectDateView.layer.borderWidth = 1
    selectDateView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.92)
    selectDateView.clipsToBounds = true
    
    //    hospitalNameLabel.text = hospital.name
    //    distanceLabel.text = hospital.distance
    //    workingDaysLabel.text = hospital.workingDays
    //    workingHoursLabel.text = hospital.workingHours
    //
    // Do any additional setup after loading the view.
    showDatePicker()
    showTimePicker()
  }
  
  
  func showDatePicker(){
    //Formate Date
    datePicker.datePickerMode = .date
    datePicker.minimumDate = Date()
    if #available(iOS 13.4, *) {
      datePicker.preferredDatePickerStyle = .wheels
    } else {
      // Fallback on earlier versions
    }
    //ToolBar
    let toolbar = UIToolbar();
    toolbar.sizeToFit()
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
    
    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
    
    selectDateTextField.inputAccessoryView = toolbar
    selectDateTextField.inputView = datePicker
    
  }
  
  
  func showTimePicker() {
    //Formate Date
    timePicker.datePickerMode = .time
    
    if #available(iOS 13.4, *) {
      timePicker.preferredDatePickerStyle = .wheels
    } else {
      // Fallback on earlier versions
    }
    //ToolBar
    let toolbar = UIToolbar();
    toolbar.sizeToFit()
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
    
    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
    
    selectTimeTextField.inputAccessoryView = toolbar
    selectTimeTextField.inputView = timePicker
    
  }
  
  @objc func donedatePicker() {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    selectDateTextField.text = formatter.string(from: datePicker.date)
    self.view.endEditing(true)
  }
  
  @objc func doneTimePicker() {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    selectTimeTextField.text = formatter.string(from: timePicker.date)
    self.view.endEditing(true)
  }
  
  @objc func cancelDatePicker() {
    self.view.endEditing(true)
  }
  
  @IBAction func bookButton(_ sender: Any) {
    guard let time = selectTimeTextField.text, !time.isEmpty else { return }
    guard let date = selectDateTextField.text, !date.isEmpty else { return }
    
  }
}
