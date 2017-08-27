//
//  Incident_ReportingUITests.swift
//  Incident ReportingUITests
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import XCTest

class Incident_ReportingUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        app = XCUIApplication()
        
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // Test Login Fail
    func testLoginFail() {
        
        // Tap Submit
        app.buttons["logout"].tap()
        
        // Input Wrong Format User Name
        app.textFields["login_textfield_username"].tap()
        app.textFields["login_textfield_username"].typeText("xuyang")
        
        // Tap Login Button
        app.buttons["login_button_login"].tap()
        
        app.alerts["Alert"].buttons["OK"].tap()
        
        // Input Correct Format User Name
        app.textFields["login_textfield_username"].tap()
        app.textFields["login_textfield_username"].typeText("xuyang1993")
        
        // Input Wrong Format Password
        app.textFields["login_textfield_password"].tap()
        app.textFields["login_textfield_password"].typeText("123")
        
        // Tap Login Button
        app.buttons["login_button_login"].tap()
        
        app.alerts["Alert"].buttons["OK"].tap()
        
    }
    
    // Test Login Success
    func testLoginSuccess() {
        
        // Input Correct Format User Name
        app.textFields["login_textfield_username"].tap()
        app.textFields["login_textfield_username"].typeText("xuyang1993")
        
        // Input Correct Format Password
        app.textFields["login_textfield_password"].tap()
        app.textFields["login_textfield_password"].typeText("1234567890")
        
        // Tap Login Button
        app.buttons["login_button_login"].tap()
        
        app.alerts["Success"].buttons["OK"].tap()
        
    }
    
    
    // Test Submit Incident Reporting Success
    func testSubmitIncidentReporting() {
        
        // SUBMIT Button Tap
        app.buttons["SUBMIT"].tap()
        
        // Machine Name Input
        app.textFields["report_textfield_machine"].tap()
        app.textFields["report_textfield_machine"].typeText("MACHINE 2017")
        
        // Location Input
        app.textFields["report_textfield_location"].tap()
        app.textFields["report_textfield_location"].typeText("TESTING ROOM")
        
        // Description Input
        app.textFields["report_textfield_description"].tap()
        app.textFields["report_textfield_description"].typeText("BROKEN!")
        
        // Submit New Report
        app.buttons["report_button_submit"].tap()
        
    }
    
    // Test Submit Incident Reporting Fail
    func testSubmitIncidentReportingFail() {
        
        // SUBMIT Button Tap
        app.buttons["SUBMIT"].tap()
        
        
        // Submit New Report
        app.buttons["report_button_submit"].tap()
        
        app.alerts["Alert"].buttons["OK"].tap()
        
        // Machine Name Input
        app.textFields["report_textfield_machine"].tap()
        app.textFields["report_textfield_machine"].typeText("MACHINE 2017")
        
        // Location Input
        app.textFields["report_textfield_location"].tap()
        app.textFields["report_textfield_location"].typeText("TESTING ROOM")
        
        
        // Submit New Report
        app.buttons["report_button_submit"].tap()
        
        app.alerts["Alert"].buttons["OK"].tap()
        
        // Description Input
        app.textFields["report_textfield_description"].tap()
        app.textFields["report_textfield_description"].typeText("BROKEN!")
        
        // Submit New Report
        app.buttons["report_button_submit"].tap()
        
    }
    
    
    // Test Submit and View Incident Reporting
    func testSubmitViewIncidentReporting() {
        
        // HISTORY Button Tap
        app.buttons["HISTORY"].tap()
        
        let table = app.tables["search_tableview"]
        
        var cells = table.cells.count
        
        // Back
        app.navigationBars["INCIDENT HISTORY"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
        // SUBMIT Button Tap
        app.buttons["SUBMIT"].tap()
        
        // Machine Name Input
        app.textFields["report_textfield_machine"].tap()
        app.textFields["report_textfield_machine"].typeText("MACHINE 2017")
        
        // Location Input
        app.textFields["report_textfield_location"].tap()
        app.textFields["report_textfield_location"].typeText("TESTING ROOM")
        
        // Description Input
        app.textFields["report_textfield_description"].tap()
        app.textFields["report_textfield_description"].typeText("BROKEN!")
        
        // Submit New Report
        app.buttons["report_button_submit"].tap()
        
        // HISTORY Button Tap
        app.buttons["HISTORY"].tap()
        
        let new_table = app.tables["search_tableview"]
        
        let new_cells = new_table.cells.count
        
        cells += 1
        
        XCTAssertEqual(new_cells, cells)
        
    }
    
}
