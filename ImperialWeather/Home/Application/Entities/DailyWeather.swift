//
//  DailyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct DailyWeather: Equatable, Identifiable, Sendable {
    let id: UUID
    let day: Date
    let icon: String
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    let plottableCelsius: PlottableCelsius<UnitTemperature>
    let plottableFahrenheit: PlottableFahrenheit<UnitTemperature>
    
    init(
        id: UUID = UUID(),
        day: Date,
        icon: String,
        celsius: Measurement<UnitTemperature>
    ) {
        self.id = id
        self.day = day
        self.icon = icon
        self.celsius = celsius
        self.fahrenheit = self.celsius.converted(to: .fahrenheit)
        self.plottableCelsius = PlottableCelsius(measurement: self.celsius)
        self.plottableFahrenheit = PlottableFahrenheit(measurement: self.fahrenheit)
    }
    
    static func == (lhs: DailyWeather, rhs: DailyWeather) -> Bool {
        return lhs.day == rhs.day && lhs.icon == rhs.icon && lhs.celsius == rhs.celsius
    }
}

extension DailyWeather {
    static func mapDailyWeatherFromData(data: [DailyWeatherPlain]) -> [DailyWeather] {
        return data.map { dailyWeatherPlain in
            mapDailyWeather(plain: dailyWeatherPlain)
        }
    }

    private static func mapDailyWeather(plain: DailyWeatherPlain) -> DailyWeather {
        return DailyWeather(
            day: plain.day,
            icon: plain.icon,
            celsius: Measurement(value: plain.temperature, unit: .celsius)
        )
    }
}
