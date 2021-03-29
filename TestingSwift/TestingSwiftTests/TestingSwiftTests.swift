//
//  TestingSwiftTests.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/26/21.
//

import XCTest
@testable import TestingSwift

class TestingSwiftTests: XCTestCase {

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
    
    func testHaterStartNicely() {
        let hater = Hater()
        
        
        XCTAssertFalse(hater.hating)
    }
    
    func testHatersAfterBadDay() {
        var hater = Hater()
        
        
        hater.hadABadDay()
        
        
        XCTAssertTrue(hater.hating)
    }
    
    func testHatersAfterGoodDay() {
        var hater = Hater()
        
        
        hater.hadAGoodDay()
        
        
        XCTAssertFalse(hater.hating)
    }
    
    func test_4Bedrooms_2Bathrooms_Fits_3Bedrooms_2Bathrooms_Requirements() {
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBathrooms = 2
        let desireBedrooms = 3
        let suitability = house.checkSuitability(desireBedrooms: desireBedrooms, desireBathrooms: desiredBathrooms)
        XCTAssertTrue(suitability)
    }
    
    func test_3_Ingredients_Cake_Cost_10() {
        let cake = Cake()
        XCTAssertEqual(cake.bake(ingredients: ["Chocolate", "Cherries", "Almond"]), 10)
    }
    
}
