//
//  FirstVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 17/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC{
            
            vc.email = textFieldEmail.text ?? ""
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveNextForPush(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC{
            
            vc.email = textFieldEmail.text ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func moveManualSegue(_ sender: Any) {
        performSegue(withIdentifier: "MySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondVC{
            vc.email = textFieldEmail.text ?? ""
        }
    }
}
