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

class MapVC: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true

        locationManager.delegate = self
//        geoCoding()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
    }
    
    func geoCoding(){
        let address = "350 5th Avenue New York, NY"
    
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error) in
            
            if error != nil{
                print("error \(error!.localizedDescription)")
            }else{
                if let coords = placemarks?[0].location?.coordinate {
                    
                    print("latitude \(coords.latitude) longitude \(coords.longitude)")
                    
                    let mkPlaceMark = MKPlacemark(coordinate: coords)
                    let mapItem = MKMapItem(placemark: mkPlaceMark)
                    
                    //mapItem.openInMaps(launchOptions: nil)
                }
                
            
            }
        }
    }
    


}
