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
    var baseServiceUrl = "http://localhost:3000/"

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

    
    
    
    
    
    
//
//    // MARK: Perform a POST Request
//    private func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//        
//        // Set the method to POST
//        request.HTTPMethod = "POST"
//        
//        do {
//            // Set the POST body for the request
//            let jsonBody = try NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
//            request.HTTPBody = jsonBody
//            let session = NSURLSession.sharedSession()
//            
//            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//                if let jsonData = data {
//                    let json:JSON = JSON(data: jsonData)
//                    onCompletion(json, nil)
//                } else {
//                    onCompletion(nil, error)
//                }
//            })
//            task.resume()
//        } catch {
//            // Create your personal error
//            onCompletion(nil, nil)
//        }
//    }

}
