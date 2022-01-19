//
//  BookAppointmentViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 27/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase


class BookAppointmentViewController: UIViewController {
  
  @IBOutlet weak var imageHospitals: UIImageView!
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
  
  var hospital: HospitalModel = Hospitals().hlist[K.R.hospitalIndex]
  
  
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
    
    hospitalNameLabel.text = hospital.name
    distanceLabel.text = hospital.distance
    workingDaysLabel.text = hospital.workingDays
    workingHoursLabel.text = hospital.workingHours
    imageHospitals.image = hospital.image
    //     Do any additional setup after loading the view.
    showDatePicker()
    showTimePicker()
  }
  
  // MARK: -  show Date Picker
  
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
    let doneButton = UIBarButtonItem(title: "Done".Localized(), style: .plain, target: self, action: #selector(donedatePicker));
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel".Localized(), style: .plain, target: self, action: #selector(cancelDatePicker));
    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
    selectDateTextField.inputAccessoryView = toolbar
    selectDateTextField.inputView = datePicker
    
  }
  
  // MARK: - show Time Picker
  
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
    let doneButton = UIBarButtonItem(title: "Done".Localized(), style: .plain, target: self, action: #selector(doneTimePicker));
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel".Localized(), style: .plain, target: self, action: #selector(cancelDatePicker));
    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
    selectTimeTextField.inputAccessoryView = toolbar
    selectTimeTextField.inputView = timePicker
    
    
  }
  
  // MARK: - donedate Picker
  
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
  
  
  // MARK: -  @IBAction
  
  @IBAction func bookButton(_ sender: Any) {
    
    guard let time = selectTimeTextField.text, !time.isEmpty else {K.alertShow(title: "Error!".Localized(), Msg: "error in getting Time ".Localized(), context: self); return }
    guard let date = selectDateTextField.text, !date.isEmpty else {K.alertShow(title: "Error!".Localized(), Msg: "error in getting Date ".Localized(), context: self); return }
    guard let userId  = Auth.auth().currentUser?.uid,!userId.isEmpty else{K.alertShow(title: "Error!".Localized(), Msg: "error in getting your Data".Localized(), context: self);return}
    let reservation = Reservation(userId: userId, hospitalName: hospital.name, date: date, time: time)
    
    Firestore.firestore().collection(K.Collections.reservations).document(userId).setData(reservation.toDic()) { dbError in
      if dbError != nil {
        K.alertShow(title: "Error!".Localized(), Msg: dbError!.localizedDescription , context: self)
      }else{
        K.alertShow(title: "success!".Localized(), Msg: "Reservation done Successfully".Localized(), context: self){result,error in
          
          if !error
          {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
            vc?.modalPresentationStyle = .fullScreen
            vc?.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.async {
              self.present(vc!, animated: true, completion: nil)
              
            }
          }
        }
        
      }
    }
    
  }
}
// MARK: - extension Localized()

extension String {
  func Localized() -> String {
    return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
  }
}



