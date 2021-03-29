//
//  NewHouse.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import Foundation

protocol NewHouseProtocol {
    var numberOfViewings: Int { get set }
    func conductViewing()
}

class NewHouse: NewHouseProtocol {
    var numberOfViewings = 0
    func conductViewing() {
        numberOfViewings += 1
    }
}
