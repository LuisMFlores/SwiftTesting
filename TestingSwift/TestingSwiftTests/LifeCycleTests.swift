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

}
