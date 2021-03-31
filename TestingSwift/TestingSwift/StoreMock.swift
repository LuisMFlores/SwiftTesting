//
//  StoreMock.swift
//  TestingSwift
//
//  Created by luis flores on 3/31/21.
//

import Foundation

class StoreMock: Store {
    var wasAssertionSuccessfull = false
    
    override func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
        wasAssertionSuccessfull = condition()
    }
}
