//
//  login.swift
//  LD-Plus
//
//  Created by Karan Sheth on 10/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class login: UIViewController {
    
    
//    MARK: Outlets
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var erolNumber: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var emailID: UITextField!
    
    @IBOutlet weak var department: UIPickerView!
    
    @IBOutlet weak var deptName: UILabel!
    
    
    @IBOutlet weak var semLabel: UILabel!
    
    
//  MARK: Methods
    
    @IBAction func createAccountTapped(_ sender: AnyObject) {
        
        let userEmail = emailID.text
        let userPassword = password.text
        let userRepeatPassword = confirmPassword.text
        //CHeck Empty Field
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty){
            
            //Display Alert message
            print("problem")
            displayMyAlertMessage("Alert", "Please Fill All Details ;)")
            return
            
        }
        
        //check if password is same 
        if(userPassword != userRepeatPassword)
        {
            displayMyAlertMessage("Password Is not Matching","Check The Passwords :( ")
            return
        }
        
        
        
        
        //Store Data
        
        let processData = "email=\(userEmail!)&password=\(userPassword!)&first_name=\(firstName.text!)&last_name=\(lastName.text!)&eroll_number=\(erolNumber.text!)&user_name=\(userName.text!)&user_dept=\(deptName.text!)&user_sem=\(semLabel.text!)"
        let wi = uer_api()
      
        let link = "http://jarvis/userRegister.php"

        let sendData = wi.conn(processData,link: link)
        let procData = wi.con_adaptor(sendData){ (data: Foundation.Data) -> () in
            let myJSON = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary
            
            if let parseJSON = myJSON {
                // Now we can access value of First Name by its key
                let resultstsring = parseJSON["status"] as? String
                let messageToDisplay = parseJSON["message"] as? String
                if(resultstsring == "error"){
                    print("Status: \(resultstsring!)")
                    if(parseJSON["email"] as? String == "1"  ){
                        print("email: \(messageToDisplay!)")
                        //Alert Message 
                        DispatchQueue.main.async(execute: {
                            let myAlert = UIAlertController(title: "Error!", message: messageToDisplay!, preferredStyle: UIAlertControllerStyle.alert);
                            let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil );
                            myAlert.addAction(okAction);
                            self.present(myAlert, animated: true, completion: nil)})
                        
                        return;
                    }
                    else if(parseJSON["user_name"] as? String == "1"  ){
                        print("User_name: \(messageToDisplay!)")
                        //Alert Message
                        DispatchQueue.main.async(execute: {
                            let myAlert = UIAlertController(title: "Error!", message: messageToDisplay!, preferredStyle: UIAlertControllerStyle.alert);
                            let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil );
                            myAlert.addAction(okAction);
                            self.present(myAlert, animated: true, completion: nil)})
                        
                        return;
                    }
                    else if(parseJSON["eroll_number"] as? String == "1"  ){
                        print("eroll_number: \(messageToDisplay!)")
                        //Alert Message
                        DispatchQueue.main.async(execute: {
                            let myAlert = UIAlertController(title: "Error!", message: messageToDisplay!, preferredStyle: UIAlertControllerStyle.alert);
                            let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil );
                            myAlert.addAction(okAction);
                            self.present(myAlert, animated: true, completion: nil)})
                        
                        return;
                    }
                    else{}
                    }
                else{
                    DispatchQueue.main.async(execute: {
                        
                        let myAlert = UIAlertController(title: "Success!", message: messageToDisplay!, preferredStyle: UIAlertControllerStyle.alert);
                        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default){ ACTION in self.dismiss(animated: true, completion: nil)};
                        
                        myAlert.addAction(okAction);
                        self.present(myAlert, animated: true, completion: nil)})
                }
                
               
                
            }
            
 }
        
            
            
            
//            var myJSON = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
//        if let parseJSON = myJSON {
//            // Now we can access value of First Name by its key
//            var resultStatus = parseJSON["status"] as? String
//            print("Status: \(resultStatus!)")
//            
//            var isUserRegistered: Bool = false
//            if(resultStatus=="Success"){ isUserRegistered = true }
//            print(isUserRegistered)
//            
//            var messageToDisplay = parseJSON["message"] as? String;}
    
    
    }
        
        
        
//        
//        let link = "http://192.168.2.10:8881/jarvis/userRegister.php"
//        let url = NSURL(string: link);
//        //        let cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
//        let request = NSMutableURLRequest(URL: url!)
//        request.HTTPMethod = "POST";
//        // Compose a query string
//        let postString = "email=\(userEmail!)&password=\(userPassword!)&first_name=\(firstName.text!)&last_name=\(lastName.text!)&eroll_number=\(erolNumber.text!)&user_name=\(userName.text!)";
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            if error != nil
//            {
//                print("error=\(error)")
//                return
//            }
//            // You can print out response object
//            print("response = \(response)")
//            // Print out response body
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("responseString = \(responseString!)")
//            //Let's convert response sent from a server side script to a NSDictionary object:
//            var err: NSError?
//            var myJSON = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
//            if let parseJSON = myJSON {
//                // Now we can access value of First Name by its key
//                var resultStatus = parseJSON["status"] as? String
//                print("Status: \(resultStatus!)")
//                
//                var isUserRegistered: Bool = false
//                if(resultStatus=="Success"){ isUserRegistered = true }
//                print(isUserRegistered)
//                
//                var messageToDisplay = parseJSON["message"] as? String;
//                
//                //MARK: Diaplay Alert
    
//
//                
//                
//                
//                
//                
//            }
//            
//        }
//        
//        task.resume()}
        
        
        
       
        
        
        
        
        
        
        
    //createAccountTapped Complets Here ...
    
    //Alert Method Code
    
    func displayMyAlertMessage(_ userHeadMessage: String,_ userMessage: String)
    {
        let myAlert = UIAlertController(title: userHeadMessage, message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil );
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    
//  MARK: etc
    
    
    
    
    
    
    
    
//  MARK: Static Section 
    
    // PickerView Code !
    let testingarr = ["karan","dhara","papa","Mom"]
    
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int{ return 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return testingarr.count;
 
}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testingarr[row];
    }
    
//    To Hide Down KeyBoard..........
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(login.DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)}

    
    
    // MARK: Tapper

    @IBAction func semTapper(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        semLabel.text = "\(value)"
        
    }
    
    
    var temparr: [Int: String] = [ 1: "Computer",2:"E.C",3:"IT",4:"Civil"]
    
    
   
    @IBAction func deptTapper(_ sender: UIStepper) {
        let value = Int(sender.value)
        deptName.text = temparr[value]
        print(temparr)
    }
    
    
 
    
    
    
    
    
    
}




  
  
    
   
    





