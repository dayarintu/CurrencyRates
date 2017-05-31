//
//  CurrencyTableViewController.swift
//  Currency Rates
//
//  Created by Daya on 5/30/17.
//  Copyright © 2017 Daya. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController {

    let myJson: [String: String] = [:]
    
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
                                OperationQueue.main.addOperation {
                                    print(IndianRupee)
                                }
                                
                                
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

    
}

    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    return cell
}

    
