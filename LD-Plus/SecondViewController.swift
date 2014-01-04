//
//  SecondViewController.swift
//  LD-Plus
//
//  Created by Karan Sheth on 10/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var user_name: UILabel!
    
    @IBOutlet weak var eroll_number: UILabel!
    
    @IBOutlet weak var department: UILabel!
    
    @IBOutlet weak var sem: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eroll_number.text = UserDefaults.standard.string(forKey: "eroll_number");
        department.text = UserDefaults.standard.string(forKey: "dept");
        user_name.text = UserDefaults.standard.string(forKey: "user_name");
        sem.text = UserDefaults.standard.string(forKey: "sem");
        
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonTapped(_ sender: AnyObject) {
        
        UserDefaults.standard.set("0", forKey: "flag")
        UserDefaults.standard.removeObject(forKey: "eroll_number")
        UserDefaults.standard.removeObject(forKey: "dept")
         UserDefaults.standard.removeObject(forKey: "user_name")
        UserDefaults.standard.removeObject(forKey: "sem")
        UserDefaults.standard.synchronize()
        
        let flag1 = UserDefaults.standard.string(forKey: "flag")!
//        var e = NSUserDefaults.standardUserDefaults().stringForKey("eroll_number")!
        
        print(flag1)
        
//        print(e)
        self.performSegue(withIdentifier: "out2", sender: self);
        
        
    }

    
    
    
    
    
}

