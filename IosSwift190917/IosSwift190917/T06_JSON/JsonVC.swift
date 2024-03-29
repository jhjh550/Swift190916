//
//  JsonVC.swift
//  IosSwift190917
//
//  Created by 박재현 on 18/09/2019.
//  Copyright © 2019 박재현. All rights reserved.
//

import UIKit
import Alamofire

class JsonVC: UIViewController {
    
    struct Country: Decodable {
        let name:String
        let capital:String
        let region:String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        jsonParsing2()
    }
    
    func jsonParsing2(){
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { (response) in
            
            do{
                let countries = try JSONDecoder().decode([Country].self, from: response.data!)
                
                for c in countries{
                    print(c)
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }

    func jsonParsing(){
        let address = "https://restcountries.eu/rest/v2/all"
        if let url = URL(string: address){
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                do{
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    for c in countries{
                        print(c)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            task.resume()
            
        }
        
        
    }
}
