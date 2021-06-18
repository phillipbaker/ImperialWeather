//
//  Conditions.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct Conditions: Codable {
    let temperature: Double
    
    var celsiusString: String {
        return String(format: "%.0f", temperature)
    }
    
    var fahrenheitString: String {
        return String(format: "%.0f",(temperature * 1.8) + 32)
    }
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
