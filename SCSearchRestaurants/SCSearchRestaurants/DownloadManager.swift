//
//  DownloadManager.swift
//  Holidays
//
//  Created by Suman Chatterjee on 03/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

class DownloadManager: NSObject {
    
    public typealias DownloadCompletionHandler = (_ response: [String: Any]?, _ cancelled: Bool) -> Void

    
    static func downloadHolidays(postCode:String,completionhandler:@escaping DownloadCompletionHandler)  {
        
        let endpoint: String =  "https://public.je-apis.com/restaurants?q=\(postCode)"
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        
//        Accept-Tenant: uk
//        Accept-Language: en-GB
//        Authorization: Basic VGVjaFRlc3RBUEk6dXNlcjI=
//        Host: public.je-apis.com
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("uk", forHTTPHeaderField: "Accept-Tenant")
        urlRequest.setValue("en-GB", forHTTPHeaderField: "Accept-Language")
        urlRequest.setValue("Basic VGVjaFRlc3RBUEk6dXNlcjI=", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("public.je-apis.com", forHTTPHeaderField: "Host")
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                completionhandler(nil,true)

                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        completionhandler(json,false)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
    }

}
