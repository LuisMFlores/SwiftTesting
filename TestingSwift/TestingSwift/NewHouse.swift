//
//  NewHouse.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

protocol HouseClassProtocol {
    var numberOfViewings: Int { get set }
    
    func conductViewing()
}

class HouseClass: HouseClassProtocol {
    var numberOfViewings = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
}
