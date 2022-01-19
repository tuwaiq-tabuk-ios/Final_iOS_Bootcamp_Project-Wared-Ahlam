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
  
  
  //The object that you use to start and stop the delivery of location-related events to your app.
  // تستخدمه لبدء وإيقاف تسليم الأحداث المتعلقة بالموقع إلى تطبيقك
  
  let locationManager = CLLocationManager()
  var selectedHospital:HospitalModel?
  let myHospitals = Hospitals()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectHospitalButton.setTitle("Select Hospital".Localized(), for: .normal)
    self.locationManager.requestAlwaysAuthorization()
    self.locationManager.requestWhenInUseAuthorization()
    
    
    // ترجع قيمة منطقية تشير إلى ما إذا كانت خدمات الموقع ممكنة على الجهاز
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      //دقة بيانات الموقع التي يريد تطبيقك تلقيها
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
      
    }
    
    mapView.delegate = self
    mapView.mapType = .standard
    mapView.isZoomEnabled = true
    mapView.isScrollEnabled = true
    
    //The geographical coordinate information.
    //معلومات الإحداثيات الجغرافية.
    if let coor = mapView.userLocation.location?.coordinate {
      mapView.setCenter(coor, animated: true)
      
    }
    
    showHospitalsMarkerOnMap()
    tableView.registerCellNib(cellClass: HospitalsTableViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    self.title = ""
    
  }
  
  // MARK: -locationManager
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    setMapView(lat: manager.location!.coordinate.latitude, lng: manager.location!.coordinate.longitude)
    let annotation = MKPointAnnotation()
    
    annotation.coordinate = getCordinate(lat: manager.location!.coordinate.latitude, lng: manager.location!.coordinate.longitude)!
    annotation.title = "Your"
    annotation.subtitle = "current location"
    mapView.addAnnotation(annotation)
    
  }
  // MARK: -show HospitalsMarkerOnMap
  // تظهر لي المستشفيات
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
  
  // MARK: - setMapView
  func setMapView(lat : Double ,lng : Double ) {
    
    if let cordinate = getCordinate(lat: lat, lng: lng){
      mapView.mapType = MKMapType.standard
      //عرض منطقة الخريطة وارتفاعها.
      let mSpan = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
      // الطول والعرض
      let region = MKCoordinateRegion(center: cordinate, span: mSpan)
      mapView.setRegion(region, animated: true)
      
    }
  }
  
  // MARK: - getCordinate
  func getCordinate (lat : Double , lng : Double) -> CLLocationCoordinate2D? {
    
    
    if !lat.isZero || !lng.isZero
    {
      let localValue : CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees.init(lat), CLLocationDegrees.init(lng))
      return localValue
    } else {
      return nil
    }
  }
  
  
  // MARK: -  @IBAction
  
  @IBAction func didSelectHospital(_ sender: Any) {
    if selectedHospital != nil {
      let story  = UIStoryboard(name: "Main", bundle: nil)
      if let next = story.instantiateViewController(withIdentifier: "StartCheckingViewController") as? StartCheckingViewController{
        self.navigationController?.pushViewController(next, animated: false)
        // next.modalPresentationStyle = .fullScreen
        //self.present(next, animated: true, completion: nil)
        
      }
    } else {
      K.alertShow(title: "Error".Localized(), Msg: "Hospital must be selected".Localized(), context: self)
    }
  }
}

// MARK: - extension
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
    
    K.R.hospitalIndex = indexPath.row
    //يطلع لي اللون الي يحدد المستشفي
    tableView.reloadData()
  }
  
}


