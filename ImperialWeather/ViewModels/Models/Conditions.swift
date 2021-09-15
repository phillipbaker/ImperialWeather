//
//  Conditions.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct Conditions: Codable {
    let temperature: Double
}

extension Conditions {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
