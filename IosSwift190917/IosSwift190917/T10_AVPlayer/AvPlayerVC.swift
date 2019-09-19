//
//  AvPlayerVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 19/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit
import AVFoundation

class AvPlayerVC: UIViewController {
    
    var myPlayer: AVPlayer?
    @IBOutlet weak var playerSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stopClicked(_ sender: Any) {
        if myPlayer != nil {
            myPlayer?.pause()
            myPlayer = nil 
        }
    }
    
    @IBAction func playClicked(_ sender: Any) {
        if myPlayer == nil {
            let address = "http://www.hochmuth.com/mp3/Vivaldi_Sonata_eminor_.mp3"
            if let url = URL(string: address){
                myPlayer = AVPlayer(url: url)
                myPlayer?.play()
                
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            }
        }
    }
    
    @objc func updateSlider(){
        if myPlayer != nil {
            if let duration = myPlayer?.currentItem?.duration, let current = myPlayer?.currentTime() {
                
                let ratio = current.seconds / duration.seconds
                playerSlider.value = Float(ratio)
            }
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if myPlayer != nil {
            let totalSeconds = myPlayer?.currentItem?.duration.seconds ?? 0.0
            
            let sliderValue = Double(sender.value)
            let seconds = totalSeconds * sliderValue
            let time = CMTime(seconds: seconds, preferredTimescale: 1)
            myPlayer?.seek(to: time)
        }
    }
}
