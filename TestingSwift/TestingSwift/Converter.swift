//
//  Converter.swift
//  TestingSwift
//
//  Created by luis flores on 3/27/21.
//

import Foundation

struct Converter {
    
    func convertToCelcius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}
