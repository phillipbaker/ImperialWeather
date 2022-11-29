//
//  DailyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension DailyWeather {
    static let preview: [DailyWeather] = [
        .init(
            day: Date.now,
            temperature: Temperature(min: 22.0, max: 32.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!,
            temperature: Temperature(min: 23.0, max: 34.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!,
            temperature: Temperature(min: 24.0, max: 36.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!,
            temperature: Temperature(min: 26.0, max: 36.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!,
            temperature: Temperature(min: 20.0, max: 32.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!,
            temperature: Temperature(min: 22.0, max: 33.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!,
            temperature: Temperature(min: 19.0, max: 29.0),
            description: [WeatherDescription.preview]
        ),
        .init(
            day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!,
            temperature: Temperature(min: 16.0, max: 27.0),
            description: [WeatherDescription.preview]
        )
    ]
}
