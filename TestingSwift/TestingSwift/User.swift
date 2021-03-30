//
//  User.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

protocol UserProtocol {
    var funds: Decimal { get set }
    var age: Int { get set }
    var apps: [AppProtocol] { get set }
    
    mutating func buy<T>(_ app: T) throws -> Bool where T : AppProtocol, T: Equatable
}

struct NewUser: UserProtocol {
    
    var funds: Decimal
    var age: Int
    var apps: [AppProtocol] = []
    
    mutating func buy<T>(_ app: T) throws -> Bool where T : AppProtocol, T : Equatable {
        let possible = try app.canBePurchased(by: self)
        if possible {
            funds -= app.price
            apps.append(app)
            return true
        }
        return false
    }

}
