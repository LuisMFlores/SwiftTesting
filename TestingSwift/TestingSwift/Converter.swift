//
//  Converter.swift
//  TestingSwift
//
//  Created by luis flores on 3/27/21.
//

import Foundation

struct Converter {
    
    func convertToCelcius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celcius = fahrenheit.converted(to: .celsius)
        return celcius.value
    }
}
