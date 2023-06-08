//
//  DailyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension DailyWeather {
    static let preview = [
        DailyWeather(
            id: UUID(),
            day: Date.now,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 22.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 25.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 39.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 26.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 22.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 24.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 27.0, unit: .celsius)
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!,
            icon: WeatherSymbol.sun,
            celsius: Measurement(value: 29.0, unit: .celsius)
        )
    ]
}
