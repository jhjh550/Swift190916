//
//  FirstVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 17/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
            
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveNextForPush(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
