//
//  SCSearchRestaurantsDownlowedTests.swift
//  SCSearchRestaurantsTests
//
//  Created by Suman Chatterjee on 16/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import XCTest
@testable import SCSearchRestaurants

class SCSearchRestaurantsDownlowedTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDownloadManager() {
        
        let resSearchExpectiation = expectation(description: "Resturent Search")
        
        DownloadManager.downloadHolidays(postCode:"TW19",completionhandler: { (response,cancled) in
            
            XCTAssertNotNil(response, "data should not be nil")
            
            guard let holidayResponses = response else {
                return
            }
            
            print("Response \(holidayResponses)")
            resSearchExpectiation.fulfill()
        })

        waitForExpectations(timeout: 10) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformanceDownloadManager() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.testDownloadManager()
        }
    }
    
}
