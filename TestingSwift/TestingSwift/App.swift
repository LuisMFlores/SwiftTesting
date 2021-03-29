//
//  App.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

protocol AppProtocol {
    var price: Decimal { get set }
    var minimumAge: Int { get set }
    var isReleased: Bool { get set }
    
    func canBePurchased(by user: UserProtocol) -> Bool
}

extension AppProtocol {
    static func printTerms() {
        print("Here are 50 pages of terms and condition")
    }
}

struct App: AppProtocol{
    
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: UserProtocol) -> Bool {
        guard isReleased else { return false }
        guard user.funds >= price else { return false }
        guard user.age >= minimumAge else { return false }
        return true
    }
}
