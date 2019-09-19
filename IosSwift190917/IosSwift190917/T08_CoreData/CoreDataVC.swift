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
    
    func getObject()->Contacts?{
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        
        let request:NSFetchRequest<Contacts> = Contacts.fetchRequest()
        request.entity = entity
        request.predicate = NSPredicate(format: "(name = %@)", nameTextField.text!)
        
        do {
            let results = try context.fetch(request)
            statusLabel.text = "\(results.count) found."
            if results.count > 0{
                return results[0]
            }
            
        } catch  {
            statusLabel.text = error.localizedDescription
        }
        
        return nil
    }
    
    @IBAction func findClicked(_ sender: Any) {
        if let contact = getObject(){
            print("name: \(contact.name) address: \(contact.address) phone: \(contact.phone)")
        }
    }
    

    @IBAction func deleteClicked(_ sender: Any) {
        if let contact = getObject(){
            context.delete(contact)
        }
    }
}
