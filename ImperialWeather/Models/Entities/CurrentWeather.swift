//
//  CurrentWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct CurrentWeather: Identifiable {
    let id: UUID
    let icon: String
    let location: String
    let description: String
    let temperature: Double
}

extension CurrentWeather {
    static func mapCurrentWeatherFromData(data: CurrentWeatherPlain) -> CurrentWeather {
        return CurrentWeather(
            id: UUID(),
            icon: data.icon,
            location: data.location,
            description: data.description,
            temperature: data.temperature
        )
    }
}
