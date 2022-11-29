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
            temperature: TemperatureRaw(min: 22.0, max: 32.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!,
            temperature: TemperatureRaw(min: 23.0, max: 34.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!,
            temperature: TemperatureRaw(min: 24.0, max: 36.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!,
            temperature: TemperatureRaw(min: 26.0, max: 36.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!,
            temperature: TemperatureRaw(min: 20.0, max: 32.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!,
            temperature: TemperatureRaw(min: 22.0, max: 33.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!,
            temperature: TemperatureRaw(min: 19.0, max: 29.0),
            description: [WeatherDescriptionRaw.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!,
            temperature: TemperatureRaw(min: 16.0, max: 27.0),
            description: [WeatherDescriptionRaw.preview]
        )
    ]
}
