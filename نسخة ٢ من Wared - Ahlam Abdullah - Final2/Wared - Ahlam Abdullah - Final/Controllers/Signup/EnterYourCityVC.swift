//
//  EnterYourCityVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class EnterYourCityVC: UIViewController {
  
  var pickerView = UIPickerView()
  
  let city = ["" , "Riyadh","Mecca","Medina","Tabuk","Abha","Hail","Jeddah","Jizan","Khobar","Sakakah","Dammam","Buraydah","Dhahran"]
  
  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBOutlet weak var cityField: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    pickerView.dataSource = self
    pickerView.delegate = self
    cityField.inputView = pickerView
    cityField.textAlignment = .center
    cityField.placeholder = "Select City"

    }
    
  @IBAction func nextButton(_ sender: Any) {
    guard let city = cityField.text , !city.isEmpty else {
        return
    }
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "bloodTypeCV")
    present(homeViewController!, animated: true, completion: nil)
  }
 
}

extension EnterYourCityVC:UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return city.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return city[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    cityField.text = city[row]
    cityField.resignFirstResponder()
    
  }
}
