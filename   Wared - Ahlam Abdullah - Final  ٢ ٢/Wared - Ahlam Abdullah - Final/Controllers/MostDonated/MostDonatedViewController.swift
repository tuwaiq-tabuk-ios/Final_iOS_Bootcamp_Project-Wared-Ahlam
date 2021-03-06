//
//  MostDonatedViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//

import UIKit
import Firebase

class MostDonatedViewController: UIViewController {
  
  //MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var donationData:[MostDonatedModel] = []
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    getData()
    tableView.registerCellNib(cellClass: DonaitorTableViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  
  // MARK: - Methods
  
  func getData() {
    db.collection("users").getDocuments { (snapshot, error) in
      if error != nil {
        print("Error")
      } else {
        if let snapshot = snapshot {
          for document in snapshot.documents {
            let data = MostDonatedModel(name: "\(document["firstName"] as? String ?? "") \(document["lastName"] as? String ?? "")", bloodType: document["bloodType"] as? String ?? "", city: document["cityName"] as? String ?? "", donationCounts: document["donated"] as? Int ?? 0)
            if data.donationCounts > 0 {
              self.donationData.append(data)
            }
          }
          self.donationData.sort {$0.donationCounts > $1.donationCounts}
          self.tableView.reloadData()
        }
      }
    }
  }
}

// MARK: -  extension

extension MostDonatedViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return donationData.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue() as DonaitorTableViewCell
    cell.configureCell(data: donationData[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
    
  }
}
