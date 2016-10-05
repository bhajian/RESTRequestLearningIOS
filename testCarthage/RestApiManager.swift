//
//  RestApiManager.swift
//  tincognito
//
//  Created by behnam hajian on 2016-09-25.
//  Copyright © 2016 bluekernel. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    

    var session = URLSession(configuration: URLSessionConfiguration.default)

    public func makeGetRequest(_ request: URLRequest){
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                let response = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(response)
            }
        })
        task.resume()
    }
    
    
    
    public func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = URLRequest(url: URL(string: path)!)
        
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error as NSError?)
            } else {
                onCompletion(nil, error as NSError?)
            }
        })
        task.resume()
    }
    
    
    
    
        // MARK: Perform a POST Request
    public func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: @escaping ServiceResponse) {
            let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
    
            // Set the method to POST
            request.httpMethod = "POST"
    
            do {
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

                // Set the POST body for the request
                let jsonBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                request.httpBody = jsonBody
                
    
                let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                    if let jsonData = data {
                        let json:JSON = JSON(data: jsonData)
                        onCompletion(json, nil)
                    } else {
                        onCompletion(nil, error as NSError?)
                    }
                })
                task.resume()
            } catch {
                // Create your personal error
                onCompletion(nil, nil)
            }
    }

    

}
