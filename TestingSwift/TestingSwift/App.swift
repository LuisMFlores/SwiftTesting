//
//  App.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

enum AppPurchasingError: Error {
    case insuficientFunds, alreadyHave, minimumAgeRestricted, notReleasedYet, unknown
}

protocol AppProtocol {
    var price: Decimal { get set }
    var minimumAge: Int { get set }
    var isReleased: Bool { get set }
    
    func canBePurchased(by user: UserProtocol) throws -> Bool
}

struct App: AppProtocol {
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: UserProtocol) throws -> Bool {
        guard user.funds >= price else { throw AppPurchasingError.insuficientFunds }
        guard user.age >= minimumAge else { throw AppPurchasingError.minimumAgeRestricted }
        guard isReleased == true else { throw AppPurchasingError.notReleasedYet }
//        guard user.apps.contains(self) else { throw AppPurchasingError.alreadyHave }
        return true
    }
}

extension App: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.isReleased == rhs.isReleased && lhs.price == rhs.price && lhs.minimumAge == rhs.minimumAge
    }
}
