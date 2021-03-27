//
//  LifeCycleTests.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/27/21.
//

import XCTest

class LifeCycleTests: XCTestCase {

    override class func setUp() {
        print("I'm in class")
    }
    
    override class func tearDown() {
        print("I'm out of class")
    }
    
    override func setUpWithError() throws {
        print("I'm setup")
    }

    override func tearDownWithError() throws {
        print("I'm teardown")
    }

    func testExample() throws {
        print("Starting Test")
        
        addTeardownBlock {
            print("In first teardownblock")
        }
        
        print("Middle of test")
        
        addTeardownBlock {
            print("In second teardownblock")
        }
        
        print("Finishing")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func divisionReminder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
        let quotient = number / dividedBy
        let remainder = number % dividedBy
        return (quotient, remainder)
    }
    
    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedReminder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedReminder, file: file, line: line)
    }
    
    func test_10Division_3Reminder_To_3Quotient_1Reminder() {
        let dividend = 10
        let divisor = 3
        
        let results = divisionReminder(of: dividend, dividedBy: divisor)
        
        verifyDivision(results, expectedQuotient: 3, expectedReminder: 1)
    }

}
