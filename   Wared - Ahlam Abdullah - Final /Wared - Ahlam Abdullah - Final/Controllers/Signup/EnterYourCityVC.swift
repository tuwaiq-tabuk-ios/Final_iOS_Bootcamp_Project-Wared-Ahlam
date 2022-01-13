//
//  EnterYourCityVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit

class EnterYourCityVC: UIViewController {
  
  @IBOutlet weak var cityField: UITextField!
  @IBOutlet weak var backButton: UIButton!
  
  var pickerView = UIPickerView()
  
  
  let city = ["" , "Riyadh".Localized(),"Mecca".Localized(),"Medina".Localized(),"Tabuk".Localized(),"Abha".Localized(),"Hail".Localized(),"Jeddah".Localized(),"Jizan".Localized(),"Khobar".Localized(),"Sakakah".Localized(),"Dammam".Localized(),"Buraydah".Localized(),"Dhahran".Localized()]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pickerView.dataSource = self
    pickerView.delegate = self
    cityField.inputView = pickerView
    cityField.textAlignment = .center
    cityField.placeholder = "Select City".Localized()
    backButton.setTitle("<".Localized(), for: .normal)
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
  }
  
  // MARK: -  @IBAction

  
  @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func nextButton(_ sender: Any) {
    guard let city = cityField.text , !city.isEmpty else {
      return
    }
    
    SignupDataModel.cityName = city
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: "bloodTypeCV") as! BooldTypeVC
    
    present(homeViewController, animated: true, completion: nil)
    
  }
  
}

// MARK: -  extension

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
