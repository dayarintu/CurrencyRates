//
//  ViewController.swift
//  Currency Rates
//
//  Created by Daya on 5/30/17.
//  Copyright © 2017 Daya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var AustralianCurrency = 0
    var IndianCurrency = 0
    var BritanCurrency = 0
    
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
                            if let AustralianCurrency = rates["AUD"] ,
                                let BritanCurrency = rates["GBP"] ,
                                let IndianCurrency = rates["INR"]
                            {
                                print(IndianCurrency)
                                print(BritanCurrency)
                                print(AustralianCurrency)
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

