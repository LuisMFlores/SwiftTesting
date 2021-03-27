//
//  ConverterTests.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/27/21.
//

import XCTest
@testable import TestingSwift

class ConverterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFahrenheitToCelcius() {
        // Given
        let sut = Converter()
        let input1 = 32.0
        let input2 = 212.0
        
        // When
        let output1 = sut.convertToCelcius(fahrenheit: input1)
        let output2 = sut.convertToCelcius(fahrenheit: input2)
        
        // Then
        XCTAssertEqual(output1, 0, "Celcius")
        XCTAssertEqual(output2, 100, "Celcius")
    }

}
