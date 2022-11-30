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
            icon: WeatherIcon.sun,
            temperature: 32.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 34.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 36.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 29.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 24.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 21.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 19.0
        ),
        DailyWeather(
            id: UUID(),
            day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 17.0
        ),
    ]
}
