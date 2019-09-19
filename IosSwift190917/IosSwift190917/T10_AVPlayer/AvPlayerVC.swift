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
            let address = "http://www.hochmuth.com/mp3/Haydn_Cello_Concerto_D-1.mp3"
            if let url = URL(string: address){
                myPlayer = AVPlayer(url: url)
                myPlayer?.play()
            }
        }
    }
}
