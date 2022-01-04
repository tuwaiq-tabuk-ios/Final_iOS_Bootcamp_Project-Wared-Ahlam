//
//  HospitalsTableViewCell.swift
//  Ahlam-Wareed
//
//  Created by Amr Saleh on 12/30/21.
//

import UIKit

class HospitalsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var workingDaysLabel: UILabel!
    @IBOutlet weak var workingHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(hospital: HospitalModel, isSelected: Bool) {
        containerView.layer.borderColor = isSelected ?  #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1) : #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.backgroundColor = isSelected ?  #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.1542701199) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        distanceView.backgroundColor = isSelected ?  .clear : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hospitalNameLabel.text = hospital.name
        distanceLabel.text = hospital.distance
        workingDaysLabel.text = hospital.workingDays
        workingHoursLabel.text = hospital.workingHours
    }
    
}
