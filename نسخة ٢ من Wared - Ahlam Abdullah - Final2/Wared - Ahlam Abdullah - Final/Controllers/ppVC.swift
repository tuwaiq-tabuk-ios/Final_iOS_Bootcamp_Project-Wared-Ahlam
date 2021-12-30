//
//  ppVC.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 26/05/1443 AH.
//

import UIKit

class : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func buttonVC(_ sender: UIButton) {
    let storybord = UIStoryboard(name: "Main", bundle: nil)
    let controller = storybord.instantiateViewController(withIdentifier: "nNNN") as! nN
    self.navigationController?.pushViewController(controller, animated: true)
    print("A")
    print("b")
    print("c")
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
