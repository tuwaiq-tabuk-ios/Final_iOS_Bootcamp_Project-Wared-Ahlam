//
//  DonaitorTableViewCell.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 23/05/1443 AH.
//


import UIKit

class DonaitorTableViewCell: UITableViewCell {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var numberOfDonations: UILabel!
  @IBOutlet weak var bloodTypeLabel: UILabel!
  @IBOutlet weak var numberOF: UILabel!
  @IBOutlet weak var bloodType: UILabel!
  
  // MARK: - Cell Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    numberOF.text = "Number of registered donations:".Localized()
    bloodType.text = "blood type:".Localized()
    
  }
  
  
  
  // MARK: - Methods
  
  func configureCell(data: MostDonatedModel) {
    nameLabel.text = data.name.Localized()
    cityLabel.text = "(\(data.city))".Localized()
    numberOfDonations.text = "\(data.donationCounts)".Localized()
    bloodTypeLabel.text = data.bloodType.Localized()
  }
}

