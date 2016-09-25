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

    private func makeGetRequest(_ request: URLRequest){
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                let response = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(response)
            }
        })
        task.resume()
    }
    
    
    
//    private func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
//        let request = URLRequest(url: URL(string: path)!)
//        
//        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
//            if let jsonData = data {
//                let json:JSON = JSON(data: jsonData)
//                onCompletion(json, error)
//            } else {
//                onCompletion(nil, error)
//            }
//        })
//        task.resume()
//    }
    
    
    
    
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
