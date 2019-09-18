//
//  TableViewController.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    struct MyData{
        let title:String
        let desc:String
        let point:Double
    }
    
    var dataList = [MyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100{
            let data = MyData(title: "title \(i)", desc: "desc \(i)", point: Double(i))
            dataList.append(data)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let data = dataList[indexPath.row]
        cell.titleLabel.text = data.title
        cell.descLabel.text = data.desc
        cell.pointLabel.text = "\(data.point)"
        
        
//        cell.textLabel?.text = data.title
//        cell.detailTextLabel?.text = data.desc
        
//        let titleLabel = cell.viewWithTag(100) as? UILabel
//        let descLabel = cell.viewWithTag(101) as? UILabel
//        let pointLabel = cell.viewWithTag(102) as? UILabel
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print( dataList[indexPath.row] )
    }
    
}
