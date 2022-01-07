//
//  DashboardTabBarController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 02/06/1443 AH.
//

import UIKit

import UIKit

class DashboardTabBarController : UITabBarController,UITabBarControllerDelegate
{
    override func viewDidLoad() {
           super.viewDidLoad()
           delegate = self
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           let item1 = HomeViewController()
           let icon1 = UITabBarItem(title: "Main", image: UIImage(named: "1-1.png"), selectedImage: UIImage(named: "3.png"))
           item1.tabBarItem = icon1
           let item2 = MostDonatedViewController()
           let icon2 = UITabBarItem(title: "Donates" ,image: UIImage(named: "1-1.png"), selectedImage: UIImage(named: "3.png"))
           item2.tabBarItem = icon2
           
           let controllers = [item1,item2]  //array of the root view controllers displayed by the tab bar interface
           self.viewControllers = controllers
       }

       //Delegate methods
       func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
           print("Should select viewController: \(viewController.title ?? "") ?")
           return true;
       }
}
