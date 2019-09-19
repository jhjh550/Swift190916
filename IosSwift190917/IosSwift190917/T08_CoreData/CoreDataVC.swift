//
//  CoreDataVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 19/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit
import CoreData

class CoreDataVC: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveClicked(_ sender: Any) {
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        
        let contact = Contacts(entity: entity!, insertInto: context)
        
        contact.name = nameTextField.text
        contact.address = addressTextField.text
        contact.phone = phoneTextField.text
        
        do{
            try context.save()
            nameTextField.text = ""
            addressTextField.text = ""
            phoneTextField.text = ""
            statusLabel.text = "Contact saved"
        }catch{
            statusLabel.text = error.localizedDescription
        }
        
    }
    
    @IBAction func findClicked(_ sender: Any) {
    }
    

}
