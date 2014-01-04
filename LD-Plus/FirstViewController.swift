//
//  FirstViewController.swift
//  LD-Plus
//
//  Created by Karan Sheth on 10/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
//    MARK: ReDirective If not LoggdIn
    override func viewDidAppear(_ animated: Bool) {
        
       let flag =  UserDefaults.standard.string(forKey: "flag")!
        print(flag)
        if(flag != "1")
        {
            self.performSegue(withIdentifier: "loginView", sender: self);
        }

    }
    
    
    

    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }

    }

