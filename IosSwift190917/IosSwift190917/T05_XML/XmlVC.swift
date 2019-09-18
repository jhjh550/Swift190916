//
//  XmlVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class XmlVC: UIViewController, XMLParserDelegate {
    
    class Pizza{
        var id: Int = 0
        var name: String = ""
        var cost: Int = 0
        var description: String = ""
    }
    
    var pizza = Pizza()
    var pizzaList = [Pizza]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "http://api.androidhive.info/pizza/?format=xml"
        
        if let url = URL(string: address){
            let parser = XMLParser(contentsOf: url)
            parser?.delegate = self
            parser?.parse()
            
            for pizza in pizzaList{
                print("\(pizza.id) \(pizza.name) \(pizza.cost) \(pizza.description)")
            }
        }
    }
    
    var tagString:String = ""
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        tagString = elementName
        if elementName == "item" {
            pizza = Pizza()
            pizzaList.append(pizza)
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch tagString {
        case "id":
            pizza.id = Int(string) ?? 0
        case "name":
            pizza.name = string
        case "cost":
            pizza.cost = Int(string) ?? 0
        case "description":
            pizza.description = string
        default:
            break
        }
        tagString = ""
    }
    

    

}
