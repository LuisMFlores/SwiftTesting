//
//  House.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

struct House {
    var bedrooms: Int
    var bathrooms: Int
    var cost: Int
    
    init(bedrooms: Int, bathrooms: Int) {
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.cost = bedrooms * bathrooms * 50_000
    }
    
    func checkSuitability(desireBedrooms: Int, desireBathrooms: Int) -> Bool {
        if bedrooms >= desireBedrooms && bathrooms >= desireBathrooms {
            return true
        } else {
            return false
        }
    }
}
