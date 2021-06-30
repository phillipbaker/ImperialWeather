//
//  Temperature.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct Temperature: Codable {
    let min: Double
    let max: Double
    
    var minCelsiusString: String {
        return String(format: "%.0f", min)
    }
    
    var maxCelsiusString: String {
        return String(format: "%.0f", max)
    }
    
    var minFahrenheitString: String {
        return String(format: "%.0f",(min * 1.8) + 32)
    }
    
    var maxFahrenheitString: String {
        return String(format: "%.0f",(max * 1.8) + 32)
    }
}
