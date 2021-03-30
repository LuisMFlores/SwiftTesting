//
//  UnreleasedAppStub.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

struct UnreleasedAppStub: AppProtocol {
    
    var price: Decimal = 0
    var minimumAge: Int = 0
    var isReleased: Bool = false
    
    func canBePurchased(by user: UserProtocol) throws -> Bool {
        return false
    }
}

extension UnreleasedAppStub: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}
