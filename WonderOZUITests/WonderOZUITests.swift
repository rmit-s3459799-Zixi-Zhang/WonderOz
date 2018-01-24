//
//  WonderOZUITests.swift
//  WonderOZUITests
//
//  Created by Jason-Zhuang on 19/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import XCTest

class WonderOZUITests: XCTestCase {
        
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
        
        
        
        let app = XCUIApplication()
        app.collectionViews.cells.otherElements.containing(.image, identifier:"camping").element.tap()
        app.tables/*@START_MENU_TOKEN@*/.buttons["favorite small blank"]/*[[".cells.buttons[\"favorite small blank\"]",".buttons[\"favorite small blank\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Adventures"].buttons["Category"].tap()
        
        
        
    }
    
    func testAdv() {
        
        
        
        /*let app = XCUIApplication()
        app.tabBars.buttons["Adventure"].tap()
        app.navigationBars["All Adventures"].buttons["Add"].tap()
        app.textFields["Category :"].tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["camping"].press(forDuration: 0.9);/*[[".pickers.pickerWheels[\"camping\"]",".tap()",".press(forDuration: 0.9);",".pickerWheels[\"camping\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        let titleTextField = app.textFields["Title :"]
        titleTextField.tap()
        titleTextField.typeText("Water Park")
        app.navigationBars["WonderOZ.NewAdvView"].buttons["Save"].tap()*/
        
        
        let app = XCUIApplication()
        app.tabBars.buttons["Adventure"].tap()
        app.navigationBars["All Adventures"].buttons["Add"].tap()
        
        let titleTextField = app.textFields["Title :"]
        titleTextField.tap()
        titleTextField.typeText("Water Park")
        
        let locationTextField = app.textFields["Location :"]
        locationTextField.tap()
        locationTextField.tap()
        locationTextField.typeText("123 Ave")
        
        let categoryTextfield = app.textFields["Category :"]
        categoryTextfield.tap()
        //app/*@START_MENU_TOKEN@*/.pickerWheels["camping"].tap()/*[[".pickers.pickerWheels[\"camping\"]",".tap()",".press(forDuration: 1.0);",".pickerWheels[\"camping\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,1]]@END_MENU_TOKEN@*/
        categoryTextfield.pickerWheels["camping"].swipeDown()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("AAAAAAA")
        app.navigationBars["WonderOZ.NewAdvView"].buttons["Save"].tap()
        app.tables.cells.containing(.staticText, identifier:"Water Park 123 Ave 0.0( km away)").buttons["favorite small blank"].tap()
       

    }
    
}
