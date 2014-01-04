//
//  mainLogin.swift
//  LD-Plus
//
//  Created by Karan Sheth on 10/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class mainLogin: UIViewController  {
    
//    MARK:OUTLETS
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var flag = false
    
//MARK: Connection Variable(s)
    
    let my_domain = "http://"
    let my_path = "jarvis/userLogin.php"
    var link = " "
    
// MARK: Methods
    
    //    To Hide keybord Down!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if(UserDefaults.standard.object(forKey: "flag") == nil)
        {
            UserDefaults.standard.setValue("0", forKey: "flag")
            UserDefaults.standard.synchronize()
            
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainLogin.DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.string(forKey: "flag")! == "1")
        {
            let flag1 = UserDefaults.standard.string(forKey: "flag")!
            
            print(flag1)
            
            self.performSegue(withIdentifier: "loggedIn", sender: self)}
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)}
    
    
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        link = my_domain + my_path
        let data_string = "user_name=\(userNameTextField.text!)&password=\(passwordTextField.text!)"
        
        let wi = uer_api()
        print(link);
        let sendData = wi.conn(data_string, link: link)
        let procData = wi.con_adaptor(sendData){ (data: Foundation.Data) -> () in
            let myJSON = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary
                if let parseJSON = myJSON {
                                // Now we can access value of First Name by its key
                                let resultStatus = parseJSON["status"] as? String
                                let eroll_number = parseJSON["eroll_number"] as? String
                                let sem = parseJSON["user_sem"] as? String
                                let dept = parseJSON["user_dept"] as? String
                                print("Status: \(resultStatus!)")
                if(resultStatus == "Success")
                {
                    let u = self.userNameTextField.text!
                    UserDefaults.standard.set(u, forKey: "user_name");print("user \(u) done")
                    UserDefaults.standard.set("1", forKey: "flag");print("user done")
                    UserDefaults.standard.set( sem!, forKey: "sem");print("sem done")
                    UserDefaults.standard.set( eroll_number! , forKey: "eroll_number");print("eroll_number done\(eroll_number!)")
                    UserDefaults.standard.set( dept!, forKey: "dept");print("dept \(dept!) done")
                    UserDefaults.standard.synchronize(); print("sync done")
                   DispatchQueue.main.async(execute: {self.performSegue(withIdentifier: "loggedIn", sender: self);})
                }else{
                    
                    DispatchQueue.main.async(execute: {
                        let myAlert = UIAlertController(title: "Error!", message: "Please Check Username Password", preferredStyle: UIAlertControllerStyle.alert);
                        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil );
                        myAlert.addAction(okAction);
                        self.present(myAlert, animated: true, completion: nil)})
                    
                    return;
                    
                    }
                
                
                
            }

            
            
        }
        
        
        
    
        
    }
    
}
