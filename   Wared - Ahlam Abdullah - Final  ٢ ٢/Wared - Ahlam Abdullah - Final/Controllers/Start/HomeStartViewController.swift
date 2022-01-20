//
//  HomeStartViewController.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 17/06/1443 AH.
//

import Foundation
import AVFoundation
import UIKit

class HomeStartViewController: UIViewController {
  
  
  //MARK: - IBOutlets
  
  @IBOutlet weak var videoLayer: UIView!
  @IBOutlet weak var btnStart: UIButton!
  
  
  // MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    playVideo()
  }
  
  
  // MARK: - Methods
  
  func playVideo() {
    guard let path = Bundle.main.path(forResource: "pexels-artem-podrez-8533517", ofType: "mp4") else {
      return
    }
    
    let player = AVPlayer(url: URL(fileURLWithPath: path))
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = self.view.bounds
    playerLayer.videoGravity = .resizeAspectFill
    self.videoLayer.layer.addSublayer(playerLayer)
    
    player.play()
    
    videoLayer.bringSubviewToFront(btnStart)
    
    
  }
  // MARK: -  @IBAction
  
  @IBAction func getStart(_ sender: UIButton) {
    
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Startview")
    vc?.modalPresentationStyle = .fullScreen
    vc?.modalTransitionStyle = .crossDissolve
    self.present(vc!, animated: true, completion: nil)
    
  }
}
