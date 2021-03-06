//
//  ConverterTests.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/27/21.
//

import XCTest
@testable import TestingSwift

class ConverterTests: XCTestCase {
    
    var sut: Converter!

    override func setUpWithError() throws {
        sut = Converter()
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
    
    func DISABLE_test_Fahrenheit_To_Celcius() {
        // Given
        let input1 = 32.0
        let input2 = 212.0
        
        // When
        let output1 = sut.convertToCelcius(fahrenheit: input1)
        let output2 = sut.convertToCelcius(fahrenheit: input2)
        
        // Then
        XCTAssertEqual(output1, 0, "Celcius")
        XCTAssertEqual(output2, 100, "Celcius")
    }
    
    func DISABLE_test_32Fahrenheit_To_0Celcius() {
//        let sut = Converter()
        let input1 = 32.0
        let output1 = sut.convertToCelcius(fahrenheit: input1)
        XCTAssertEqual(output1, 0, "Celcius")
        
    }
    
    func DISABLE_test_212Fahrenheit_To_32Celcius() {
//        let sut = Converter()
        let input2 = 212.0
        let output2 = sut.convertToCelcius(fahrenheit: input2)
        XCTAssertEqual(output2, 100, "Celcius")
    }
    
    func test_32Fahrenheit_To_0Celcius() {
        let inputInFahrenheit = 32.0
        let outputInCelcius = sut.convertToCelcius(fahrenheit: inputInFahrenheit)
        XCTAssertEqual(outputInCelcius, 0, accuracy: 0.000001, "Celcius")
    }
    
    func test_212Fahrenheit_To_32Celcius() {
        let inputInFahrenheit = 212.0
        let outputInCelcius = sut.convertToCelcius(fahrenheit: inputInFahrenheit)
        XCTAssertEqual(outputInCelcius, 100, accuracy: 0.000001, "Celcius")
    }
    
    func test_100Fahrenheit_To_37Celcius() {
        let inputInFahrenheit = 100.0
        let outputInCelcius = sut.convertToCelcius(fahrenheit: inputInFahrenheit)
        XCTAssertEqual(outputInCelcius, 37.777777, accuracy: 0.000001)
    }

}
