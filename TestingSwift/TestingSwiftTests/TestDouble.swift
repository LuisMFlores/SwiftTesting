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
        let unreleaseApp = UnreleasedAppStub()
        var sut = NewUser(funds: 10, age: 30)

        XCTAssertFalse(try sut.buy(unreleaseApp))
        
    }

    func test_Open_Internal_URL() {
        let sut = URLHandler(urlOpener: UIApplication.shared.open)
    }
    
    func test_Viewing_House_Adds_One_To_Viewings() {
        let house = HouseClass()
        let initialViewings = house.numberOfViewings
        house.conductViewing()
        XCTAssertEqual(house.numberOfViewings, initialViewings + 1)
    }
    
    func test_Buyer_Viewing_House_Adds_To_Viewings() {
        let sut = Buyer()
        let houseMock = NewHouseMock()
        let initialNumberOfViewing = houseMock.numberOfViewings
        
        sut.view(houseMock)
        
        XCTAssertEqual(houseMock.numberOfViewings, initialNumberOfViewing + 1)
    }
    
    func test_Unplugged_Device_Shows_Down() {
        let unpluggedDevice = DeviceMock(state: .unplugged)
        let sut = PowerMonitor(device: unpluggedDevice)
        
        let message = sut.getStatus()
        
        XCTAssertEqual(message, "Power Off")
    }
    
    func test_News_Fetch_Loads_Correct_URL() {
        
        // Given
        let url = URL(string: "https://www.google.com")!
        let sut = News(with: url)
        let mockURLSession = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading stories")
        
        // When
        sut.fetch(with: mockURLSession) {
            XCTAssertEqual(mockURLSession.lastURL, url)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_News_Fetch_Calls_Resume() {
        
        // Given
        let url = URL(string: "https://www.google.com")!
        let sut = News(with: url)
        let mockURLSession = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading stories")
        
        sut.fetch(with: mockURLSession) {
            XCTAssertTrue(mockURLSession.dataTask?.hasStarted ?? false)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_News_Fetch_Data() {
        
        // Given
        let url = URL(string: "https://www.google.com")!
        let sut = News(with: url)
        let mockURLSession = URLSessionMock()
        mockURLSession.testData = Data("Hello World".utf8)
        let expectation = XCTestExpectation(description: "Downloading stories")
        
        sut.fetch(with: mockURLSession) {
            XCTAssertEqual(sut.stories, "Hello World")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_News_Fetch_Data_With_Error() {
        
        // Given
        let url = URL(string: "https://www.google.com")!
        let sut = News(with: url)
        let mockURLSession = URLSessionMock()
        mockURLSession.testError = AppPurchasingError.unknown
        let expectation = XCTestExpectation(description: "Downloading stories")
        
        sut.fetch(with: mockURLSession) {
            XCTAssertEqual(mockURLSession.dataTask?.testError, AppPurchasingError.unknown)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}
