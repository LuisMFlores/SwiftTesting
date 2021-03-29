//
//  Cake.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

struct Cake {
    func bake(ingredients: [String]) -> Int {
        for ingredient in ingredients {
            print("Adding \(ingredient)")
        }
        
        let cost = 1 + (ingredients.count * 3)
        print("The cake cost is ready; Please pay \(cost)")
        return cost
    }
}
