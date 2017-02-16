//
//  ViewController.swift
//  SCSearchRestaurants
//
//  Created by Suman Chatterjee on 16/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DownloadManager.downloadHolidays(postCode:"TW19",completionhandler: { (response,cancled) in
            
            guard let holidayResponses = response else {
                return
            }
            
            print("Response \(holidayResponses)")
        //    HolidayInfoViewModel.sharedInstance.holidayBuilder(for:holidayResponses)
            
        })

        
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

