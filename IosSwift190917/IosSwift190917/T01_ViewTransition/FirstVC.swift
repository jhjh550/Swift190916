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
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        if vc != nil {
            present(vc!, animated: true, completion: nil)
        }
    }
    
}
