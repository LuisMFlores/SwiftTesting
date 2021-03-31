//
//  NewHouseMock.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

class NewHouseMock: HouseClassProtocol {
    var numberOfViewings = 0
    
    func conductViewing() {
    numberOfViewings += 1
    }
}
