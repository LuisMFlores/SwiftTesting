//
//  Hater.swift
//  TestingSwift
//
//  Created by luis flores on 3/26/21.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
