//
//  Double+fahrenheitString.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/12/21.
//

import Foundation

extension Double {
    var fahrenheitStringShort: String {
        return String(format: "%.0f", (self * 1.8) + 32) + Degrees.f
    }
    
    var fahrenheitString: String {
        return String(format: "%.0f", (self * 1.8) + 32) + Degrees.fahrenheit
    }

}
