//
//  UnreleaseAppStub.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import Foundation

struct UnreleaseAppStub: AppProtocol {
    
    var price: Decimal = 0
    var minimumAge: Int = 0
    var isReleased: Bool = false
    
    func canBePurchased(by user: UserProtocol) -> Bool {
        return false
    }
}
