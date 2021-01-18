//
//  ViewController.swift
//  Currency Converter
//
//  Created by Alperen Dogu on 16.01.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://api.ratesapi.io/api/latest").responseJSON {response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                
                let EURUSD = json["rates"]["USD"]
                let EURTRY = json["rates"]["TRY"]
                debugPrint("1 EUR = "+"\(EURTRY)")
                
                
            case .failure(let error):
                print(error)
            }
        }
        
       
    }

}

