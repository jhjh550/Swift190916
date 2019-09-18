//
//  XmlVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class XmlVC: UIViewController, XMLParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "http://api.androidhive.info/pizza/?format=xml"
        
        if let url = URL(string: address){
            let parser = XMLParser(contentsOf: url)
            parser?.delegate = self
            parser?.parse()
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        <#code#>
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print(string)
    }
    

    

}
