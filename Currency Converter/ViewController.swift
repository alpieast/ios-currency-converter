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
        parseRates()
        CurrenciesTable.delegate = self
        CurrenciesTable.dataSource = self
        
       
    }
    
    @IBOutlet weak var CurrenciesTable: UITableView!
    
    var countedSymb = 0
    var symbols = [String]()
    var currencyWantedToConvert = String()
    
    
    func parseRates(){
        AF.request("https://api.ratesapi.io/api/latest").responseJSON {response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let parsedRates = json["rates"]
                
                
                
                for (symbol,rate) in parsedRates{
                    self.symbols.append(symbol)
                    self.symbols.sort()
                }
                
                print(self.symbols)
                print(self.symbols.count)
                self.countedSymb = self.symbols.count
                self.CurrenciesTable.reloadData()
                
                
            case .failure(let error):
                print(error)
            }
        }
    }

    
    func rateChangerBySelectedCurrency() {
            }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You Tapped me!")
    }
}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countedSymb
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = symbols[indexPath.row]
        return cell
    }
    
    
    
    
}
