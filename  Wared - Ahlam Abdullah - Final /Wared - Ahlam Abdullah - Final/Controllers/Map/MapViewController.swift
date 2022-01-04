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
  
  let locationManager = CLLocationManager()
  
  var selectedHospital:HospitalModel?
  let myHospitals = Hospitals()
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    self.locationManager.requestAlwaysAuthorization()
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
      
    }
    
    mapView.delegate = self
    mapView.mapType = .standard
    mapView.isZoomEnabled = true
    mapView.isScrollEnabled = true
    
    if let coor = mapView.userLocation.location?.coordinate{
      mapView.setCenter(coor, animated: true)
    }
    
    showHospitalsMarkerOnMap()
    tableView.registerCellNib(cellClass: HospitalsTableViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    self.title = ""
    
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    setMapView(lat: manager.location!.coordinate.latitude, lng: manager.location!.coordinate.longitude)
    //تحديد
    let annotation = MKPointAnnotation()
    
    annotation.coordinate = getCordinate(lat: manager.location!.coordinate.latitude, lng: manager.location!.coordinate.longitude)!
    annotation.title = "Your"
    annotation.subtitle = "current location"
    mapView.addAnnotation(annotation)
    
  }
  
  func showHospitalsMarkerOnMap() {
    
    for hospital in self.myHospitals.hlist {
      let annotation = MKPointAnnotation()
      if let cordinate = getCordinate(lat: hospital.lat, lng: hospital.lng){
        annotation.coordinate = cordinate
        annotation.title = hospital.name
        annotation.subtitle = hospital.workingDays + "\n" + hospital.workingHours
        mapView.addAnnotation(annotation)
      }
      
    }
  }
  
  
  func setMapView(lat : Double ,lng : Double ) {
    
    if let cordinate = getCordinate(lat: lat, lng: lng){
      mapView.mapType = MKMapType.standard
      // تحديد الزوم
      let mSpan = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
      
      let region = MKCoordinateRegion(center: cordinate, span: mSpan)
      mapView.setRegion(region, animated: true)
      
    }
  }
  
  func getCordinate (lat : Double , lng : Double) -> CLLocationCoordinate2D?
  {
    if !lat.isZero || !lng.isZero
    {
      //تمرير
      let localValue : CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees.init(lat), CLLocationDegrees.init(lng))
      return localValue
    } else {
      return nil
    }
  }
  
  @IBAction func didSelectHospital(_ sender: Any) {
    
    let story  = UIStoryboard(name: "Main", bundle: nil)
    if let next = story.instantiateViewController(withIdentifier: "StartCheckingViewController") as? StartCheckingViewController{
      next.modalPresentationStyle = .fullScreen
      self.present(next, animated: true, completion: nil)
      
    }
  }
}

extension MapViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.myHospitals.hlist.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue() as HospitalsTableViewCell
    cell.configureCell(hospital: self.myHospitals.hlist[indexPath.row], isSelected: self.myHospitals.hlist[indexPath.row].name == selectedHospital?.name)
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.selectedHospital = self.myHospitals.hlist[indexPath.row]
    if !(selectedHospital?.lng.isZero)! || !(selectedHospital?.lat.isZero)!
    {
      self.setMapView(lat: selectedHospital!.lat, lng: selectedHospital!.lng)
    }
    self.setMapView(lat: selectedHospital!.lat, lng: selectedHospital!.lng)
    selectHospitalButton.isEnabled = true
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
}
