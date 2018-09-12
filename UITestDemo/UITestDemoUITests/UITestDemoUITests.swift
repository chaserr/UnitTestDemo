//  UITestDemoUITests.swift
//  Created on 2018/9/7
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import XCTest

class UITestDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

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
    
    func testTapViewDetailWhenSwitchIsOffDoesNothing() {
        let app = XCUIApplication()
        
        // Change the switch to off.
        app.switches["View Detail Enabled Switch"].tap()
        
        // Tap the view detail button.
        app.buttons["View Detail"].tap()
        
        // Verify that nothing has happened and we are still at the menu scren.
        XCTAssertEqual(app.navigationBars.element.identifier, "Menu")
    }
    
    func testTapViewDetailWhenSwitchIsOnNavigatesToDetailViewController() {
        let app = XCUIApplication()
        XCUIApplication().buttons["View Detail"].tap()
        XCTAssertEqual(app.navigationBars.element.identifier, "Detail")
    }
    
    func testTapIncrementButtonIncrementsValueLabel() {
        
        let app = XCUIApplication()
        app.buttons["View Detail"].tap()
        
        let incrementValueButton = app.buttons["Increment Value"]
        let valueLabel = app.staticTexts["Number Value Label"]
        for index in 0...10 {
            // Tap the increment value button.
            incrementValueButton.tap()
            // Ensure that the value has increased by 1.
            XCTAssertEqual(valueLabel.value as! String, "\(index + 1)")
        }

    }
    
}
