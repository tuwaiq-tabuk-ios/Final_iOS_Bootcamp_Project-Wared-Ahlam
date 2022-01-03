//
//  MapViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 27/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController ,CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectHospitalButton: UIButton!
  

    override func viewDidLoad() {
        super.viewDidLoad()
       
        }
    
    
    @IBAction func didSelectHospital(_ sender: Any) {
       
    }


}
