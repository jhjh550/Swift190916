//
//  MapVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 19/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        geoCoding()
    }
    
    func geoCoding(){
        let address = "350 5th Avenue New York, NY"
    
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error) in
            
            if error != nil{
                print("error \(error!.localizedDescription)")
            }else{
                if let coords = placemarks?[0].location?.coordinate {
                    
                    print("latitude \(coords.latitude) longitude \(coords.longitude)")
                    
                }
                
            
            }
        }
    }
    


}
