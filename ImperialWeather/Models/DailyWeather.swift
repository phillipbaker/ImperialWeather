//
//  DailyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    let id = UUID()
    let day: Date
    let temperature: Temperature
    let description: [WeatherDescription]
}

extension DailyWeather {
    enum CodingKeys: String, CodingKey {
        case day = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}
