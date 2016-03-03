//
//  DownloadService.swift
//  JustEatSwift
//
//  Created by Suman Chatterjee on 21/02/2016.
//  Copyright © 2016 Suman Chatterjee. All rights reserved.
//

import Alamofire
import SwiftyJSON

class DownloadService: NSObject {
    
    class func downLoadRestaurants(forPostCode:String, completionClosure: (result :Bool) -> Void)
    {
        let headers = [
            "Accept-Tenant": "uk",
            "Accept-Language": "en-GB",
            "Authorization": "Basic VGVjaFRlc3RBUEk6dXNlcjI=",
            "Host": "public.je-apis.com"
        ]
        
        // using string interplotaion
        Alamofire.request(.GET, "https://public.je-apis.com/restaurants?q=\(forPostCode.removeWhitespace())", headers: headers)
            .responseJSON { response in
                debugPrint(response)
                
                switch response.result {
                case .Success(let data):
                    let json = JSON(data)
                    parseJSON(json)
                    completionClosure(result: true)
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                    completionClosure(result: false)
                }
        }
        
    }
    
    class func parseJSON(json: JSON) {
        let restaurantsArray = json["Restaurants"].array
        
        for result in restaurantsArray!{
            let address = result["Address"].stringValue
            let cuisineTypes = result["CuisineTypes"].arrayValue
            let name = result["Name"].stringValue
            
            print(address)
            print(name)
        }
    }
}
