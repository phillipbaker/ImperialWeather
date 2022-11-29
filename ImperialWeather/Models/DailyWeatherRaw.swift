//
//  DailyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct DailyWeatherRaw: Codable, Identifiable {
    let id = UUID()
    let day: Date
    let temperature: TemperatureRaw
    let description: [WeatherDescriptionRaw]
}

extension DailyWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case day = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}

extension DailyWeatherRaw: Equatable {
    static func == (lhs: DailyWeatherRaw, rhs: DailyWeatherRaw) -> Bool {
        lhs.id == rhs.id
    }
}
