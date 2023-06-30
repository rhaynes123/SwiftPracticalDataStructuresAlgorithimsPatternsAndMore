//
//  PostAppUITests.swift
//  PostAppUITests
//
//  Created by richard Haynes on 6/30/23.
//

import XCTest

final class PostAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testListShowsUpWithItems() {
        //give
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        // when
        app.launch()
        // then
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Post #1: sunt aut facere repellat provident occaecati excepturi optio reprehenderit"]/*[[".cells.buttons[\"Post #1: sunt aut facere repellat provident occaecati excepturi optio reprehenderit\"]",".buttons[\"Post #1: sunt aut facere repellat provident occaecati excepturi optio reprehenderit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let top20PostsButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Top 20 Posts"]
        top20PostsButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
