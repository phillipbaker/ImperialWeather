//
//  CurrentWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct CurrentWeatherRaw: Codable {
    let coordinates: CoordinatesRaw
    let description: [WeatherDescriptionRaw]
    let conditions: ConditionsRaw
    let location: String?
}

extension CurrentWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case description = "weather"
        case conditions = "main"
        case location = "name"
    }
}
