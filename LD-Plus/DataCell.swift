//
//  DataCell.swift
//  LD-Plus
//
//  Created by Karan Sheth on 13/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    
    @IBOutlet weak var marks2: UILabel!
    
    @IBOutlet weak var marks: UILabel!
    
    var data: Data!{
        didSet{
            marks.text = data.game
            marks2.text = data.name
            marks.lineBreakMode = NSLineBreakMode.byWordWrapping
            marks.numberOfLines = 3
            
            marks2.lineBreakMode = NSLineBreakMode.byWordWrapping
            marks2.numberOfLines = 3
        }
        
    }
    
    

}
