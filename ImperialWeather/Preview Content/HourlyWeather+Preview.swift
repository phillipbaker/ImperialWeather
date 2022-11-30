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
            icon: WeatherIcon.cloud,
            temperature: 17.4
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.drizzle,
            temperature: 19.2
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.heavyRain,
            temperature: 22.0
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.rain,
            temperature: 26.0
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.thunderstorm,
            temperature: 19.7
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.snow,
            temperature: 16.9
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.sun,
            temperature: 14.5
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.placeholder,
            temperature: 16.0
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.dust,
            temperature: 21.0
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.fog,
            temperature: 19.5
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.haze,
            temperature: 17.6
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.ice,
            temperature: 15.0
        ),
        HourlyWeather(
            id: UUID(),
            hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!,
            icon: WeatherIcon.moonStars,
            temperature: 14.5
        )
    ]
}
