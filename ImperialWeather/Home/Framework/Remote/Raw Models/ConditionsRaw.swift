//
//  ConditionsRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct ConditionsRaw: Codable {
    let temperature: Double
}

extension ConditionsRaw {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
