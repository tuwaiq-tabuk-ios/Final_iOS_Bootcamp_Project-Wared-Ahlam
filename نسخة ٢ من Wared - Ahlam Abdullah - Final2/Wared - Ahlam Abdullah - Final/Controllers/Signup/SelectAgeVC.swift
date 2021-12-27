//
//  VC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 22/05/1443 AH.
//
import UIKit

class SelectAgeVC: UIViewController {
  
  // Age of 18.

  let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
  
  // Age of 65.
  let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -65, to: Date())!;
  
  
//  @IBAction func goBack(_ sender: Any) {
//    dismiss(animated: true, completion: nil)
//  }
//  
  @IBOutlet weak var datePicker: UIDatePicker!
  
  
  @IBAction func validateButtonPressed(_ sender: Any) {
    let isValidAge = validateAge(birthDate: datePicker.date);
    
    
    if isValidAge {
      //    showAlert(title: "Valid Age", message: "You are between 18 and 100 years old")
      transitionToHome()
      
    } else {
      showAlert(title: "Invalid Age", message: "You must be over 18 old")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  func validateAge(birthDate: Date) -> Bool {
    var isValid: Bool = true;
    
    if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
      isValid = false;
    }
    
    return isValid;
  }
  
  func showAlert(title: String, message: String) {
    // Create alert controller.
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
    
    // Create alert action to add to controller.
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil);
    
    // Add action.
    alertController.addAction(alertAction);
    
    // Display alert.
    self.present(alertController, animated: true, completion: nil);
  }
  
  func transitionToHome() {
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "bloodTypeCV")
    present(homeViewController!, animated: true, completion: nil)
    
  }
  
  
}

