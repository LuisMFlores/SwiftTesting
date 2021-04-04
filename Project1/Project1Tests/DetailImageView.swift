//
//  DetailImageView.swift
//  Project1Tests
//
//  Created by luis flores on 4/3/21.
//

import XCTest
@testable import Project1

class DetailImageView: XCTestCase {

    func testDetailImageViewExist() {
        // Given
        let sut = DetailViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailImageViewBackgroundColorIsWhite() {
        // Given
        let sut = DetailViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.imageView.backgroundColor, .white)
    }
    
    func testDetailImageViewContentModeIsAspectFit() {
        // Given
        let sut = DetailViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.imageView.contentMode, .scaleAspectFit)
    }
    
    func testDetailLoadsImage() {
        // Given
        let fileToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: fileToTest, in: Bundle.main, with: nil)
        let sut = DetailViewController()
        
        // When
        sut.selectedImage = fileToTest
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    func testSelectingImageShowsDetails() {

        let sut = ViewController()
        let navigationController = UINavigationController(rootViewController: sut)
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        let expectation = XCTestExpectation(description: "Selecting a tableview cell")
        
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        
        guard let detail = navigationController.topViewController as? DetailViewController else { XCTFail("Unable to push detail view controller") ; return }
        
        let fileToTest = "nssl0049.jpg"
        let expectedImage = UIImage(named: fileToTest)
        detail.selectedImage = fileToTest
        detail.loadViewIfNeeded()
        
        XCTAssertEqual(detail.imageView.image, expectedImage)
    }

}
