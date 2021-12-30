//
//  MapViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 26/05/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let iniralloc = CLLocation(latitude: 24.693719, longitude: 46.723596)
    setStaritingLocation(location: iniralloc, distance: 1000)
  }
  
  func setStaritingLocation(location: CLLocation, distance: CLLocationDistance){
    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
    mapView.setRegion(region, animated: true)
    
    //منطقه محدده
    mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
    let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 3000)
    mapView.setCameraZoomRange(zoomRange, animated: true)
    addAnnotation()
    
  }
  func addAnnotation() {
    let pin = MKPointAnnotation()
    pin.coordinate = CLLocationCoordinate2D(latitude: 24.693719, longitude: 46.723596)
    pin.title = "My Title"
    pin.subtitle = "My pin subtitle"
    mapView.addAnnotation(pin)
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
