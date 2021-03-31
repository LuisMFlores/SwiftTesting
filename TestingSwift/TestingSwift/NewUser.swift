//
//  NewUser.swift
//  TestingSwift
//
//  Created by luis flores on 3/31/21.
//

import Foundation

class NewNewUser {
}

class Store {
    var user: NewNewUser?
    
    func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
        Swift.assert(condition(), message(), file: file, line: line)
        }
    
    func buy(product: String) -> Bool {
        assert(user != nil, "We can't buy anything without a user")
        print("The user bought something")
        return true
    }
}
