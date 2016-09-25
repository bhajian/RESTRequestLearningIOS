//
//  ViewController.swift
//  testCarthage
//
//  Created by behnam hajian on 2016-09-25.
//  Copyright © 2016 bluekernel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiManager = RestApiManager();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let route = "http://localhost:3000/"
        let request = URLRequest(url: URL(string: route + "users")!)
        apiManager.makeGetRequest(request);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

