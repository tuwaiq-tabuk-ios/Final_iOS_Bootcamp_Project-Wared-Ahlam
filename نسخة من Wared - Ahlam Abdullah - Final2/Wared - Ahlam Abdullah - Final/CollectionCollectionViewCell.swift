//
//  CollectionCollectionViewCell.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 16/05/1443 AH.
//

import UIKit

class CollectionCollectionViewCell: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var tybeColl = ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"]
  
 override func viewDidLoad() {
    super.viewDidLoad()
   collectionView?.dataSource = self
   collectionView.delegate = self
   
 }
}

extension CollectionCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
  
  {
    return tybeColl.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCellLabel", for: [indexPath.row])
     return cell
  }
}
