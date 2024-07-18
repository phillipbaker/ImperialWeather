//
//  HourlyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct HourlyWeather: Equatable, Identifiable {
    let id: UUID
    let hour: Date
    let icon: String
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>

    init(
        id: UUID = UUID(),
        hour: Date,
        icon: String,
        celsius: Measurement<UnitTemperature>
    ) {
        self.id = id
        self.hour = hour
        self.icon = icon
        self.celsius = celsius
        self.fahrenheit = self.celsius.converted(to: .fahrenheit)
    }

    static func == (lhs: HourlyWeather, rhs: HourlyWeather) -> Bool {
        return lhs.hour == rhs.hour && lhs.icon == rhs.icon && lhs.icon == rhs.icon && lhs.celsius == rhs.celsius
    }
}

extension HourlyWeather {
    static func mapHourlyWeatherFromData(data: [HourlyWeatherPlain]) -> [HourlyWeather] {
        return data.map { hourlyWeatherPlain in
            mapHourlyWeather(plain: hourlyWeatherPlain)
        }
    }

    private static func mapHourlyWeather(plain: HourlyWeatherPlain) -> HourlyWeather {
        return HourlyWeather(
            hour: plain.hour,
            icon: plain.icon,
            celsius: Measurement(value: plain.temperature, unit: .celsius)
        )
    }
}
