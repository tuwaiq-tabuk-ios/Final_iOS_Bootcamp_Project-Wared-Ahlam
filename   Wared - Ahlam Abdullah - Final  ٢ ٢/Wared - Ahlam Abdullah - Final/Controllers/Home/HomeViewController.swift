//
//  HomeViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import PopupDialog

class HomeViewController: UIViewController {
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var bookBtn: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var bloodTypeLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var donateLabel: UILabel!
  @IBOutlet weak var hospitalNameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var buttonsAction: UIButton!
  
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  
  var userId = "" , donated = 0 , city = "" , bloodType = "" , hospitalName = "" ,date = "" , time = "" , haveAppointment = false
  
  var collectionImagesDate = [UIImage(named: "999")!,
                         UIImage(named: "1010")!,
                         UIImage(named: "9090")!]
  var timer : Timer?
  var cutrrentCellIndex = 0
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bookBtn.setTitle("Book Appointment".Localized(), for: .normal)
    startTimer()
    collectionView.delegate = self
    collectionView.dataSource = self
    pageControl.numberOfPages = collectionImagesDate.count
    
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hospitalName = ""
    date = ""
    time = ""
    self.messageLabel.text = "Reservation".Localized()
    getUserData()
    getReservationData()
    
  }
  
  // MARK: - Methods
  
  func getUserData() {
    
    self.userId = Auth.auth().currentUser!.uid
    print("UserId : \(self.userId)")
    db.collection(K.Collections.users).document(userId).getDocument() { document, error in
      if error != nil {
        print("error in getting user Data : ".Localized() + error!.localizedDescription)
      }
      
      if let doc = document!.data(){
        let firstName = doc["firstName"] as! String
        let lastName = doc["lastName"] as! String
        self.city = doc["cityName"] as! String
        self.bloodType = doc["bloodType"] as! String
        self.donated = doc["donated"] as! Int
        K.UserData.email = doc["email"] as! String
        K.UserData.name = firstName + " " + lastName
        K.UserData.bloodType = self.bloodType
        K.UserData.donation = self.donated
        self.nameLabel.text = firstName
        self.cityLabel.text = self.city.Localized()
        self.bloodTypeLabel.text = self.bloodType
        self.donateLabel.text = "\(self.donated)" .Localized()
        
        
      }
    }
    
  }
  
  
  func getReservationData() {
    
    db.collection(K.Collections.reservations).document(self.userId).getDocument() { document, error in
      if let doc = document!.data(){
        self.hospitalName = doc["hospitalName"] as! String
        self.date = doc["date"] as! String
        self.time = doc["time"] as! String
        
        self.haveAppointment = true
        self.hospitalNameLabel.text = self.hospitalName
        self.dateLabel.text = self.date
        self.timeLabel.text = self.time
        
      } else {
        self.hospitalNameLabel.numberOfLines = 2
        self.hospitalNameLabel.text = "Our records indicate that you haven't donated yet. Do Good!".Localized()
        self.haveAppointment = false
        self.dateLabel.text = ""
        self.timeLabel.text = ""
        
      }
      
      
      self.buttonsAction.isHidden = !self.haveAppointment
    }
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(timeInterval: 3,
                                 target: self,
                                 selector: #selector (moveToNextIndex),
                                 userInfo: nil,
                                 repeats: true)
  }
  
  
  @objc func moveToNextIndex() {
    
    if cutrrentCellIndex < collectionImagesDate.count - 1{
      cutrrentCellIndex += 1
      
    } else {
      cutrrentCellIndex = 0
    }
    
    collectionView.scrollToItem(at: IndexPath(item: cutrrentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = cutrrentCellIndex
    
  }
  
  
  
  
  func editReservation() {
    
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController")
      self.navigationController?.pushViewController(vc!, animated: true)
      
  }
  
  
  
  func deleteReservation() {
    
    let uid = Auth.auth().currentUser!.uid
    db.collection("Reservations").whereField("userId", isEqualTo: uid).getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          document.reference.delete()
        }
        
        self.getReservationData()
      }
    }
  }
  
  
  // MARK: -  @IBAction
  

  @IBAction func didAppointment(_ sender: Any) {
    
    if self.haveAppointment
    {
      K.alertShow(title: "Error!".Localized(), Msg: "Sorry there is already Appoinment".Localized(), context: self)
      
    } else{
      let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController")
      self.navigationController?.pushViewController(vc!, animated: true)
      
    }
  }
  
  @IBAction func buttonAction(_ sender: Any) {
    // Prepare the popup assets
    
    let message = "Are you sure about canceling the appointment?".Localized()
    
    
    // Create the dialog
    let popup = PopupDialog(title: title, message: message)
    
    // Create buttons
    let buttonOne = CancelButton(title: "Cancel".Localized()) {
    }
    
    // This button will not the dismiss the dialog
    let buttonTwo = DefaultButton(title: "Edit".Localized(), dismissOnTap: true) {
      self.editReservation()
    }
    
    let buttonThree = DefaultButton(title: "Delete".Localized(), height: 60, dismissOnTap: true) {
      self.deleteReservation()
    }
    
    
    buttonTwo.backgroundColor = #colorLiteral(red: 0.8328976035, green: 0.928514421, blue: 0.9267629981, alpha: 1)
    buttonThree.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.9294117647, blue: 0.9254901961, alpha: 1)
    
    popup.addButtons([buttonTwo, buttonThree, buttonOne])
    
    // Present dialog
    self.present(popup, animated: true, completion: nil)
    
  }
}



// MARK: -  extension

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return collectionImagesDate.count
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionCell
    cell.imageCollection.image = collectionImagesDate[indexPath.row]
    return cell
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
}



