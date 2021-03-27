//
//  ThrowingTests.swift
//  TestingSwiftTests
//
//  Created by luis flores on 3/27/21.
//

import XCTest
@testable import TestingSwift

class ThrowingTests: XCTestCase {

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
    
    func test_Playing_Bioblitz_Throws() {
        let game = Game(name: "bioblitz")
        
        do {
            try game.play()
            XCTFail("bioblitz has not been purchased")
        } catch GameError.notPucharsed {
            // Success
        } catch {
            XCTFail()
        }
    }
    
    func test_Playing_Blastazap_Throws() {
        let game = Game(name: "blastazap")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func test_Playing_Exploding_Monkeys() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    func DEACTIVATED_test_Playing_Dead_Storm_Rising_Throws() throws {
        let game = Game(name: "dead storm rising")
        try game.play()
    }
    
    func test_Playing_Dead_Storm_Rising_Throws() {
        let game = Game(name:"dead storm rising")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.parentalControlDisallowed)
        }
    }
    
    
    func test_Playing_Crashy_Planes_Doesnt_Throw() throws {
        let game = Game(name: "Crashy Planes")
        try game.play()
    }

}
