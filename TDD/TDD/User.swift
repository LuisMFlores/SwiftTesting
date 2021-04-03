//
//  User.swift
//  TDD
//
//  Created by luis flores on 4/2/21.
//

import Foundation

struct User {
    
    // MARK: Properties
    
    var products = Set<String>()
    
    // MARK: Methods
    
    mutating func buy(_ book: String) {
        products.insert(book)
    }
    
    func owns(_ book: String) -> Bool {
        return products.contains(book)
    }
}
