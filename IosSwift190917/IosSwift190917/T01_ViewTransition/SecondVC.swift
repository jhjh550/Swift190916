//
//  SecondVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 17/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    var email:String = ""
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = email
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func movePrev(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
