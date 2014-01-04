//
//  ExternalResult.swift
//  LD-Plus
//
//  Created by Karan Sheth on 11/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class ExternalResult: UITableViewController {
    
    
    var numberOfSem = UserDefaults.standard.integer(forKey: "sem") - 1
    
    var passSem = Int()
    
    override func viewDidLoad() {
        
    }
    
    
    //let typeOfResult = ["Mid-sem","externl"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(numberOfSem)
            return numberOfSem
        }
    
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "extResultCell", for: indexPath)
                cell.textLabel?.text = "Semester \(indexPath.row+1)"
    //            cell.detailTextLabel?.text = player.game
                return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "extToeFinal") {
            let svc = segue.destination as! eFinalView;
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                passSem = selectedRow + 1}
            
            svc.semNumber = passSem
        
        }
        
    }
}
