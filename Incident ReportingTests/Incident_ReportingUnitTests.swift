//
//  Incident_ReportingUnitTests.swift
//  Incident Reporting
//
//  Created by XuYang on 27/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import XCTest

@testable import Incident_Reporting



class Incident_ReportingUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInputLengthMoreThanEight() {
        
        let test_username = "xuyang1993"
        
        let username = test_username.checkLength()
        
        XCTAssertEqual(username, true)
        
        
        let test_password = "123456"
        
        let password = test_password.checkLength()
        
        XCTAssertEqual(password, false)
        
    }
    
}
