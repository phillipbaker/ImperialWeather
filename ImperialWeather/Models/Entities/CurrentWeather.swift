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
    
    static func mapCurrentWeather(plain: CurrentWeatherPlain) -> CurrentWeather {
        return CurrentWeather(
            id: UUID(),
            icon: plain.icon,
            location: plain.location,
            description: plain.description,
            temperature: plain.temperature
        )
    }
}
