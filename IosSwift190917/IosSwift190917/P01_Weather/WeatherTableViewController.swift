//
//  TableViewController.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, XMLParserDelegate {
    
    class Weather{
        var hour:Int = 0
        var day:Int = 0
        var temp:Double = 0.0
        var wfKor:String = ""
    }
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
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
