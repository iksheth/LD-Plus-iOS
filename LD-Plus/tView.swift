//
//  tView.swift
//  LD-Plus
//
//  Created by Karan Sheth on 11/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit
import CoreData

class tView: UITableViewController {
    
    
    
    override func viewDidAppear(_ animated: Bool) {
    
        
        
//        var flag = NSUserDefaults.standardUserDefaults().stringForKey("flag")!
//        if(flag != "1")
//        {
//            self.performSegueWithIdentifier("out", sender: self);
//        }
    }
    
   
    
    
    
    
    
    
    
    
    
//    let playersData = [
//        Player(name:"Bill Evans", game:"Tic-Tac-Toe", rating: 4),
//        Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
//        Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2) ]
//    
//    
//    let typeOfResult = ["Mid-sem","externl"]
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return typeOfResult.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("typeResult", forIndexPath: indexPath)
//            cell.textLabel?.text = typeOfResult[indexPath.row]
////            cell.detailTextLabel?.text = player.game
//            return cell
//    }
//    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            print(indexPath.section)
        }
        
       
        
    
        
    
    

}
}
