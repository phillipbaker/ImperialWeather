//
//  CurrentWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct CurrentWeatherRaw: Codable {
    let location: String?
    let conditions: ConditionsRaw
    let description: [WeatherDescriptionRaw]
    
    func mapToPlain() -> CurrentWeatherPlain {
        return CurrentWeatherPlain(
            icon: WeatherDescriptionRaw.mapFirstIcon(from: description),
            location: location ?? "Unknown Location",
            description: WeatherDescriptionRaw.mapFirstDescription(from: description),
            temperature: conditions.temperature
        )
    }
}

extension CurrentWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case location = "name"
        case conditions = "main"
        case description = "weather"
    }
}
