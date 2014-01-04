//
//  api.swift
//  LD-Plus
//
//  Created by Karan Sheth on 11/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class uer_api: UIViewController {
    
    
    
    func conn(_ data: String,link: String)->URLRequest{
        
        //let link = "http://jarvis/userRegister.php"
        let url = URL(string: link);
        var request = URLRequest(url: url!)
        request.httpMethod = "POST";
        // Compose a query string
        let postString = "\(data)";
        print(data)
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        return request
    }
    // section 2
    func con_adaptor(_ request: URLRequest, completionHandler: @escaping (_ data: Foundation.Data) -> Void){
       
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            // You can print out response object
            print("response = \(response)")
            // Print out response body
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            completionHandler(data!);
           
            
        }) 
        
        task.resume()
//       
        
    }
    
}

            
            
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            // var err: NSError?
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
//                
//                
//                //            //MARK: Diaplay Alert
//                //            dispatch_async(dispatch_get_main_queue(),{
//                //
//                //                let myAlert = UIAlertController(title: "Registerd", message: messageToDisplay!, preferredStyle: UIAlertControllerStyle.Alert);
//                //                let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.Default){ ACTION in self.dismissViewControllerAnimated(true, completion: nil)};
//                //
//                //                myAlert.addAction(okAction);
//                //                self.presentViewController(myAlert, animated: true, completion: nil)})
//                
//                
//                
//                
//                
//                
//            }
            

