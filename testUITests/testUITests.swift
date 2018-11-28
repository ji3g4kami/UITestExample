//
//  testUITests.swift
//  testUITests
//
//  Created by udn on 2018/11/28.
//  Copyright © 2018 dengli. All rights reserved.
//

import XCTest

class testUITests: XCTestCase {
    
    let app = XCUIApplication()
    var tableView: XCUIElement!
    

    override func setUp() {
        self.tableView = app.tables["MyTable"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangeTableRowText() {
        let cell = tableView.cells.containing(.cell, identifier: "3")
        let cellLabelText = cell.staticTexts.element(boundBy: 0).label
        XCTAssertEqual(cellLabelText, "Fourth Row")
        
        cell.staticTexts.element(boundBy: 0).tap()
        XCTAssertEqual(app.staticTexts["titleLabel"].label, cellLabelText)
        
        let textField = app.otherElements.textFields["titleTextField"]
        textField.tap()
        textField.typeText("Some new value")
        
        XCTAssertEqual(textField.value as? String ?? "", "Some new value")
        
//        app.otherElements.containing(.navigationBar, identifier:"test.DetailView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.navigationBars["test.DetailView"].buttons["Back"].tap()
        
        XCTAssertEqual(cell.staticTexts.element(boundBy: 0).label, "Some new value")
        
    }

}
