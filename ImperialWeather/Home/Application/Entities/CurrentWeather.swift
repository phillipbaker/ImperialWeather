//
//  CurrentWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct CurrentWeather: Equatable, Identifiable {
    let id: UUID
    let icon: String
    let location: String
    let description: String
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>

    init(
        id: UUID = UUID(),
        icon: String,
        location: String,
        description: String,
        celsius: Measurement<UnitTemperature>
    ) {
        self.id = id
        self.icon = icon
        self.location = location
        self.description = description
        self.celsius = celsius
        self.fahrenheit = self.celsius.converted(to: .fahrenheit)
    }

    static func == (lhs: CurrentWeather, rhs: CurrentWeather) -> Bool {
        return lhs.icon == rhs.icon &&
        lhs.location == rhs.location &&
        lhs.description == rhs.description &&
        lhs.celsius == rhs.celsius
    }
}

extension CurrentWeather {
    static func mapCurrentWeatherFromData(data: CurrentWeatherPlain) -> CurrentWeather {
        return CurrentWeather(
            icon: data.icon,
            location: data.location,
            description: data.description,
            celsius: Measurement(value: data.temperature, unit: .celsius)
        )
    }
}
