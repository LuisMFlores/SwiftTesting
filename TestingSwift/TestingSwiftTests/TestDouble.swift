//
//  TestDouble.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/29/21.
//

import XCTest
@testable import TestingSwift

class TestDouble: XCTestCase {

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
    
    func test_User_Cant_Buy_Unreleased_App() {
        struct UnreleaseAppStub: AppProtocol {
            var price: Decimal = 0
            var minimumAge: Int = 0
            var isReleased: Bool = false
            
            func canBePurchased(by user: UserProtocol) -> Bool {
                return false
            }
        }
        
        // Given
        var sut = User(funds: 100, age: 21, apps: [])
        let app = UnreleaseAppStub()
        
        type(of: app).printTerms()
        
        // When
        let wasBought = sut.buy(app: app)
        
        //Then
        XCTAssertFalse(wasBought)
        
    }

}
