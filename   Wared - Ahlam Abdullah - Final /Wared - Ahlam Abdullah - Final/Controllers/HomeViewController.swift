//
//  HomeViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
  
  
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
  
  var userId = "" , donated = "" , city = "" , bloodType = "" , hospitalName = "" ,date = "" , time = "" , haveAppointment = false
  
  
  var collectionImage = [UIImage(named: "1")!,
                          UIImage(named: "2")!,
                          UIImage(named: "3")!]
  
  var timer : Timer?
  var cutrrentCell = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bookBtn.setTitle("Book Appointment".Localized(), for: .normal)
    self.title = "".Localized()
    startTimer()
    collectionView.delegate = self
    collectionView.dataSource = self
    pageControl.numberOfPages = collectionImage.count
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

    func getUserData() {
    
    let db = Firestore.firestore()
    self.userId = Auth.auth().currentUser!.uid
    print("UserId : \(self.userId)")
    db.collection(Constants.Collections.users).document(userId).getDocument() { Document, error in
      if error != nil {
        print("error in getting user Data : " + error!.localizedDescription)
      }
      
      if let doc = Document!.data(){
        let firstName = doc["firstName"] as! String
        let lastName = doc["lastName"] as! String
        print(firstName)
        self.city = doc["cityName"] as! String
        self.bloodType = doc["bloodType"] as! String
        self.donated = doc["donated"] as! String
        Constants.UserData.email = doc["email"] as! String
        Constants.UserData.name = firstName + " " + lastName
        Constants.UserData.bloodType = self.bloodType
        Constants.UserData.donation = self.donated
        self.nameLabel.text = firstName
        self.cityLabel.text = self.city.Localized()
        self.bloodTypeLabel.text = self.bloodType
        self.donateLabel.text = "".Localized()  + self.donated
        
        
      }
    }
  }
  
  
  func getReservationData() {
    
    let db = Firestore.firestore()
    db.collection(Constants.Collections.reservations).document(self.userId).getDocument() { Document, error in
      if let doc = Document!.data(){
        print(doc.keys)
        self.hospitalName = doc["hospitalName"] as! String
        self.date = doc["date"] as! String
        self.time = doc["time"] as! String
        
        self.haveAppointment = true
        self.hospitalNameLabel.text = self.hospitalName
        
      } else {
        self.hospitalNameLabel.numberOfLines = 2
        
        self.hospitalNameLabel.text = "Our records indicate that you haven't donated yet. Do Good!".Localized()
        self.haveAppointment = false
        
      }
      
      self.dateLabel.text = self.date
      self.timeLabel.text = self.time
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
    
    if cutrrentCell < collectionImage.count - 1{
      cutrrentCell += 1
      
    } else {
      cutrrentCell = 0
    }
    
    collectionView.scrollToItem(at: IndexPath(item: cutrrentCell, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = cutrrentCell
  
  }

  
  @IBAction func didAppointment(_ sender: Any) {
    if self.haveAppointment
    {
      Constants.alertShow(title: "Error!", Msg: "Sorry there is already Appoinment ", context: self)
    }else
    {
      self.performSegue(withIdentifier: "goToMap", sender: nil)
    }
    
  }
  
}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return collectionImage.count
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionCell
    cell.imageCollection.image = collectionImage[indexPath.row]
    return cell

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     return 0
   }
 }



