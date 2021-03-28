//
//  AsynchronousTest.swift
//  AsynchronousTest
//
//  Created by luis flores on 3/28/21.
//

import XCTest

@testable import TestingSwift

class AsynchronousTest: XCTestCase {

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_Primes_Up_To_100_Should_Be_0() {
        let maxCount = 10000000
        let expectation = XCTestExpectation(description: "Run some work async")
        PrimeCalculator.calculate(upTo: maxCount) {
            XCTAssertEqual($0.count, 664579)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30.0)
    }

}
