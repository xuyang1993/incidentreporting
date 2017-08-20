//
//  Incident_ReportingTests.swift
//  Incident ReportingTests
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import XCTest

@testable import Incident_Reporting

class Incident_ReportingTests: XCTestCase {
    
    var app: XCUIApplication!
    
    var controllerUnderTest: LogInViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app = XCUIApplication()
        
        app.launch()
        
        controllerUnderTest = UIStoryboard(name: "Main",bundle: nil).instantiateInitialViewController() as! LogInViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
