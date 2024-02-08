//
//  HourlyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

fileprivate let now = Date.now

extension HourlyWeather {
    static let preview = [
        HourlyWeather(
            id: UUID(),
            hour: now,
            icon: WeatherSymbol.cloud,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: now)!,
            icon: WeatherSymbol.drizzle,
            celsius: Measurement(value: 24.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 2, to: now)!,
            icon: WeatherSymbol.heavyRain,
            celsius: Measurement(value: 17.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 3, to: now)!,
            icon: WeatherSymbol.rain,
            celsius: Measurement(value: 15.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 4, to: now)!,
            icon: WeatherSymbol.thunderstorm,
            celsius: Measurement(value: 16.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 5, to: now)!,
            icon: WeatherSymbol.snow,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 6, to: now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 26.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 7, to: now)!,
            icon: WeatherSymbol.placeholder,
            celsius: Measurement(value: 21.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 8, to: now)!,
            icon: WeatherSymbol.dust,
            celsius: Measurement(value: 22.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 9, to: now)!,
            icon: WeatherSymbol.fog,
            celsius: Measurement(value: 34.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 10, to: now)!,
            icon: WeatherSymbol.haze,
            celsius: Measurement(value: 29.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 11, to: now)!,
            icon: WeatherSymbol.ice,
            celsius: Measurement(value: 32.0, unit: .celsius)
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 12, to: now)!,
            icon: WeatherSymbol.moonStars,
            celsius: Measurement(value: 36.0, unit: .celsius)
        )
    ]
}
