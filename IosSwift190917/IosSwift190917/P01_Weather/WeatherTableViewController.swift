//
//  TableViewController.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, XMLParserDelegate {
    
    
    var weather = Weather()
    var weatherList = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1153052000"
        if let url = URL(string: address){
            let parser = XMLParser(contentsOf: url)
            parser?.delegate = self
            parser?.parse()
            
            for w in weatherList{
                print(w.wfKor)
            }
        }
        
    }
    
    //////////////////////////////////////////////////
    var tagString = ""
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        tagString = elementName
        if elementName == "data"{
            weather = Weather()
            weatherList.append(weather)
        }
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch tagString {
        case "hour":
            weather.hour = Int(string) ?? 0
        case "day":
            weather.day = Int(string) ?? 0
        case "temp":
            weather.temp = Double(string) ?? 0.0
        case "wfKor":
            weather.wfKor = string
        default:
            break
        }
        tagString = ""
    }
    //////////////////////////////////////////////////

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        if let cell = cell as? WeatherTableViewCell {
            let weather = weatherList[indexPath.row]
            cell.dayLabel.text = "\(weather.day)"
            cell.hourLabel.text = "\(weather.hour)시"
            cell.tempLabel.text = "\(weather.temp)도"
            cell.wfKorLabel.text = "\(weather.wfKor)"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherDetailVC") as? WeatherDetailVC{
            
            vc.weather = weatherList[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
