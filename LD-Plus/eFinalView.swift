//
//  eFinalView.swift
//  LD-Plus
//
//  Created by Karan Sheth on 12/10/15.
//  Copyright © 2015 Karan Sheth. All rights reserved.
//

import UIKit

class eFinalView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var tableData = [String]()
    var semNumber = Int()
    var n = Int()
    var offset = 0
     var enroll_number = UserDefaults.standard.object(forKey: "eroll_number")!
    var dept = UserDefaults.standard.string(forKey: "dept")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dept)
        tableview.dataSource = self
        tableview.delegate = self
        print("eroll:-\(enroll_number)")
        let my_domain = "http://"
                let my_path = "jarvis/externalResult.php"
        
                let link = my_domain + my_path
                let data_string = "eroll_number=\(enroll_number)&user_sem=\(semNumber)&dept=\(dept)"
        
                let wi = uer_api()
                print(link);
                let sendData = wi.conn(data_string, link: link)
                let procData = wi.con_adaptor(sendData){ (data: Foundation.Data) -> () in
                    let myJSON = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary
        
                    if let parseJSON = myJSON {
//        
                        if( parseJSON["status"]! as! String == "Success")
                        {
                        for (kind, numbers) in myJSON! {
                                               self.n = self.n + 1
                                                print(self.n)}
                            self.offset = Int(self.n/2);
                            print("offset:---\(self.offset)")
                
                    for i in 1  ..< self.n 
                    {
                      let a = String(i)
                        
                        if(parseJSON[a] as? String == nil){
                            self.tableData.append("Wait For This Subject Result! :)");
                        }
                        else{
                            self.tableData.append((parseJSON[a] as? String)!)}
                       print(self.tableData)
                    }
                    
                    
                    print("sem number \(self.semNumber)")
                        }  else{
                            self.n = 2
                            self.tableData.append("Wait For This Subject Result! :)")
                            print("thappo")}
                    self.tableview.reloadData()
                        
                }
  
        
        // Do any additional setup after loading the view.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("bolll")
        return offset
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let offsetIndex = indexPath.row + offset;
        
        let PData = [
            Data(game:tableData[offsetIndex],name:tableData[indexPath.row])]
        var t: [Data] = PData
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eFInalView", for: indexPath) as! DataCell
       
        cell.data = t[0] as Data
//        cell.textLabel?.text = tableData[indexPath.row]
        return cell
}
    
    
    
    
    
}
