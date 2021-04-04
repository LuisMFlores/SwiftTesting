//
//  Project1Tests.swift
//  Project1Tests
//
//  Created by luis flores on 4/3/21.
//

import XCTest
@testable import Project1

class Project1Tests: XCTestCase {

    func testLoadingImages() {
        
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.pictures.count, 10, "There should be 10 times.")
    }

    func testTableExists() {
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasCorrectRowCount() {
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 10, "There should be 10 pictures showing")
    }
    
    func testEachCellHasTheCorrectText() {
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            
            // Then
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func testCellsHaveDisclosureIndicator() {
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        let numberOfCells = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        (0..<numberOfCells).forEach {
            let indexPath = IndexPath(row: $0, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testViewControllersUsesLargeTitles() {
        // Given
        let sut = ViewController()
        let _ = UINavigationController(rootViewController: sut)
        
        // When
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    func testViewControllerHasStormViewerTitle() {
        // Given
        let sut = ViewController()
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }
    
    
}
