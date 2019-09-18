// 날씨 주소 xml 파싱 -> hour, day, temp, wfKor
// http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1153052000

// tableViewController ( custom cell - label 4개 )

// item 클릭했을 때 새로운 view 에서 보여주기
// navigationController pushViewController
// -> ViewController ( label 4개 )



















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
