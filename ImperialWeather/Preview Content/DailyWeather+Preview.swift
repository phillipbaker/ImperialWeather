//
//  DailyWeatherRaw+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension DailyWeatherRaw {
    static let preview: [DailyWeatherRaw] = [
        .init(
            day: Date.now,
            temperature: TemperatureRaw(max: 32.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!,
            temperature: TemperatureRaw(max: 34.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!,
            temperature: TemperatureRaw(max: 36.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!,
            temperature: TemperatureRaw(max: 36.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!,
            temperature: TemperatureRaw(max: 32.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!,
            temperature: TemperatureRaw(max: 33.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!,
            temperature: TemperatureRaw(max: 29.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!,
            temperature: TemperatureRaw(max: 27.0),
            description: [WeatherDescriptionRaw.preview]
        )
    ]
}
