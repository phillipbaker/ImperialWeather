//
//  HourlyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension HourlyWeather {
    static let preview: [HourlyWeather] = [
        .init(
            hour: Date.now,
            temperature: 79.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            temperature: 77.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 2, to: Date.now)!,
            temperature: 77.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 3, to: Date.now)!,
            temperature: 77.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 4, to: Date.now)!,
            temperature: 76.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 5, to: Date.now)!,
            temperature: 75.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 6, to: Date.now)!,
            temperature: 75.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 7, to: Date.now)!,
            temperature: 74.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 8, to: Date.now)!,
            temperature: 73.0,
            description: [WeatherDescription.preview]
        ),
        .init(
            hour: Calendar.current.date(byAdding: .hour, value: 9, to: Date.now)!,
            temperature: 73.0,
            description: [WeatherDescription.preview]
        )
    ]
}
