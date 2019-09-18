//
//  WeatherDetailVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var wfKorLabel: UILabel!
    
    var weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayLabel.text = "\(weather.day)"
        hourLabel.text = "\(weather.hour)시"
        tempLabel.text = "\(weather.temp)도"
        wfKorLabel.text = "\(weather.wfKor)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
