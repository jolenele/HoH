//
//  HoHUITests.swift
//  HoHUITests
//
//  Created by Macintosh HD on 2020-03-15.
//  Copyright © 2020 Jolene. All rights reserved.
//

import XCTest

class XCTOSSignpostMetric: NSObject {
    
}

class HoHUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    // Func test refactor
    func testRefactored() {
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        XCTAssert(app.staticTexts["Humans of Hue"].exists)
    }
}
