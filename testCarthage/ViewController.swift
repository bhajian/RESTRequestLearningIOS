//
//  ViewController.swift
//  testCarthage
//
//  Created by behnam hajian on 2016-09-25.
//  Copyright © 2016 bluekernel. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreData

class ViewController: UIViewController {

    let apiManager = RestApiManager();
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let route = "http://localhost:3000/authenticate"
//        let request = URLRequest(url: URL(string: route + "user/users")!)
//        apiManager.makeGetRequest(request);
        
//        apiManager.makeHTTPGetRequest(path: route, onCompletion: { (json: JSON, err) in
//            self.labelResult.text = json.string
//            if let results = json["users"].array {
//                for entry in results {
//                    
//                    self.labelResult.text = entry.string
//                }
//            }
//        });
        
        
        
        let postItems:[String: String] = ["password": "password", "userName": "behnam"]
        
        
        apiManager.makeHTTPPostRequest(path: route, body: postItems as [String : AnyObject], onCompletion: { (json: JSON, err) in
            print( json["message"])
            if let results = json["message"].array {
                for entry in results {
                    
                    print(entry)
                }
            }
        });
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func saveTouchUp(_ sender: AnyObject) {

        
    }
    


}

