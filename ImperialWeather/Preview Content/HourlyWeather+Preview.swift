//
//  HourlyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension HourlyWeather {
    static let preview = [
        HourlyWeather(
            id: UUID(),
            hour: Date.now,
            icon: WeatherSymbol.cloud,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.drizzle,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.heavyRain,
            celsius: Measurement(value: 17.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.rain,
            celsius: Measurement(value: 15.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.thunderstorm,
            celsius: Measurement(value: 16.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.snow,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 26.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.placeholder,
            celsius: Measurement(value: 21.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.dust,
            celsius: Measurement(value: 22.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.fog,
            celsius: Measurement(value: 34.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.haze,
            celsius: Measurement(value: 29.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.ice,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherSymbol.moonStars,
            celsius: Measurement(value: 36.0, unit: .celsius)
        )
    ]
}
