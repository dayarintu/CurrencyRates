//
//  ViewController.swift
//  Currency Rates
//
//  Created by Daya on 5/30/17.
//  Copyright © 2017 Daya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response , error) in
            if error != nil {
                print("Error")
            } else {
                if let content = data
                {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            if let IndianRupee = rates["INR"]
                            {
                                self.label.text = String(describing: IndianRupee)
                               
                            }
                        }
                    }
                    catch {
                        
                    }
                }
            }
            
        }
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

/*

Bulgarian Lev	BGN
Brazilian Real	 BRL
Canadian Dollar   CAD
Swiss Franc     CHF
Chinese Yuan     CNY
Czech Koruna      CZK
Danish Krone      DKK
British Pound      GBP
Hong Kong Dollar    HKD
Croatian Kuna        HRK
Hungarian Forint     HUF
Indonesian Rupiah    IDR
Israeli New Shekel    ILS
Japanese Yen          JPY
South Korean Won      KRW
Mexican Peso          MXN
Malaysian Ringgit     MYR
 Norwegian Krone      NOK
New Zealand Dollar    NZD
 Philippine Peso      PHP
 Polish Zloty         PLN
 Romanian Leu         RON
 Russian Ruble        RUB
 Swedish Krona        SEK
 Singapore DollaR     SGD
 Thai Baht            THB
 Turkish Lira         TRY
 South African Rand   ZAR
 United States Dollar   USD

 
 

*/

