//
//  ValidationUtility.swift
//  JustEatSwift
//
//  Created by Suman Chatterjee on 20/02/2016.
//  Copyright © 2016 Suman Chatterjee. All rights reserved.
//

import Foundation

extension String{
    
    func isAValidPostCode() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Za-z]{1,2}[0-9Rr][0-9A-Za-z]?\\s?[0-9][ABD-HJLNP-UW-Zabd-hjlnp-uw-z]{2}$", options: [.CaseInsensitive])
        return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, characters.count)) != nil
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }

}
