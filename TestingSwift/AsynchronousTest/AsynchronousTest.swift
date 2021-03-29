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
    
    func DISABLE_test_Primes_Up_To_100_Should_Be_0() {
        let maxCount = 10000000
        let expectation = XCTestExpectation(description: "Run some work async")
        PrimeCalculator.calculate(upTo: maxCount) {
            XCTAssertEqual($0.count, 664579)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30.0)
    }

    func test_Start_Move_Delay_For_2_Seconds() {
        let ai = AI()
        let wait2SecondsExpectation = XCTestExpectation(description: "AI should wait at least 2 seconds before starting to move")
        wait2SecondsExpectation.isInverted = true
        ai.startMove {
            wait2SecondsExpectation.fulfill()
        }
        wait(for: [wait2SecondsExpectation], timeout: 1.8)
    }
    
    func DISABLED_test_Primes_Up_To_100_Should_Be_25() {
        let maxCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maxCount)")
        expectation.expectedFulfillmentCount = 25
        PrimeCalculator.calculateStreaming(upTo: maxCount) { number in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_Prime_Calculator_Printing_Up_To_100() {
        let maxCount = 100
        let expection = XCTestExpectation(description: "Should run 100 times")
        expection.expectedFulfillmentCount = 100
        PrimeCalculator.print(upTo: maxCount) {_ in
            expection.fulfill()
        }
        wait(for: [expection], timeout: 10.0)
    }
    
    func test_Primes_Up_To_100_Should_Be_25() {
        let maxCount = 100
        let progress = PrimeCalculator.calculateProgress(upTo: maxCount) {
            XCTAssertEqual($0.count, 25)
        }
        let predicate = NSPredicate(format: "%@.completedUnitCount == %@", argumentArray: [progress, maxCount])
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_User_Upgraded_Post_Notification() {
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
        user.upgrade()
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_User_Upgraded_To_Level_Gold() {
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
        expectation.handler = { notification -> Bool in
            return notification.userInfo![UserLevel.LEVEL_KEY] as! UserLevel == .gold
        }
        user.upgrade(to: .gold)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_User_Upgraded_To_Level_Gold_Using_Custom_Notification_Center() {
        let user = User()
        let center = NotificationCenter()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification, object: nil, notificationCenter: center)
        expectation.handler = { notification -> Bool in
            return notification.userInfo![UserLevel.LEVEL_KEY] as! UserLevel == .gold
        }
        user.upgrade(using: center, to: .gold)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func DISABLE_test_Prime_Performance() {
        measure {
            _ = PrimeCalculator.calculateSync(upTo: 1_000_000)
        }
    }
}
