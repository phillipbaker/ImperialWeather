//
//  HourlyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct HourlyWeatherRaw: Codable, Identifiable {
    let id = UUID()
    let hour: Date
    let temperature: Double
    let description: [WeatherDescriptionRaw]
}

extension HourlyWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case hour = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}
