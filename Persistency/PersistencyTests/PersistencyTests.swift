//
//  PersistencyTests.swift
//  PersistencyTests
//
//  Created by cedric blaser on 25.10.20.
//

import XCTest
@testable import Persistency

class PersistencyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveArrayToFile() throws {
        // Arrange
        let app = AppDelegate()
        let expected = ["test", "test2"]
        // Act
        app.saveStringArray(_array: expected)
        let actual = app.loadStringArray()
        // Assert
        XCTAssertEqual(actual[0], expected[0], "First item is equal")
        XCTAssertEqual(actual[1], expected[1], "Second item is equal")
    }

    
    func testSaveArrayToFileUnequal() throws {
        // Arrange
        let app = AppDelegate()
        let expected = ["test", "test2"]
        let other = ["test3", "test4"]
        
        // Act
        app.saveStringArray(_array: expected)
        app.saveStringArray(_array: other)
        let actual = app.loadStringArray()
        // Assert
        XCTAssertNotEqual(actual[0], expected[0], "First item is not equal")
        XCTAssertNotEqual(actual[1], expected[1], "Second item is not equal")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let app = AppDelegate()
            let expected = ["test", "test2"]
            app.saveStringArray(_array: expected)
            let actual = app.loadStringArray()
        }
    }

}
