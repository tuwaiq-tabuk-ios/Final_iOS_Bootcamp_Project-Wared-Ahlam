//
//  DonaitorTableViewCell.swift
//  Wared - Ahlam Abdullah - Final
//
//

import UIKit

class DonaitorTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var numberOfDonations: UILabel!
  @IBOutlet weak var bloodTypeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureCell(data: MostDonatedModel) {
    nameLabel.text = data.name
    cityLabel.text = "(\(data.city))"
    numberOfDonations.text = "\(data.donationCounts)"
    bloodTypeLabel.text = data.bloodType
  }
}

