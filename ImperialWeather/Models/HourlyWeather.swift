//
//  HourlyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct HourlyWeather: Codable, Identifiable {
    let id = UUID()
    let hour: Date
    let temperature: Double
    let description: [WeatherDescription]
}

extension HourlyWeather {
    enum CodingKeys: String, CodingKey {
        case hour = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}
