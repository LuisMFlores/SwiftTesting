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
        let testIndexPath = IndexPath(row: 0, section: 0)
        var selectedImage: String?
        
        sut.pictureSelectionAction = {
            selectedImage = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }
    
    func testSelectingImageShowsDetailsImage() {
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let selectedImage = UIImage(named: "nssl0049.jpg", in: Bundle.main, with: nil)
        
        sut.pictureSelectionAction = {
            
            let detailVC = DetailViewController()
            detailVC.selectedImage = $0
            detailVC.loadViewIfNeeded()
            
            XCTAssertEqual(detailVC.imageView.image, selectedImage)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }

}
