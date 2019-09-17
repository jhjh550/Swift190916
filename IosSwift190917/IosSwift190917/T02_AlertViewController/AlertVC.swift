//
//  AlertVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 17/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("action clicked")
        }
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { (action) in
            let btn = sender as! UIButton
            btn.setTitle(alert.textFields?[0].text, for: .normal)
        }
        
        alert.addAction(action)
        alert.addAction(actionOK)
        
        alert.addTextField { (textField) in
            textField.placeholder = "input password"
            textField.isSecureTextEntry = true
        }
        
        present(alert, animated: true, completion: nil)
    }
}
