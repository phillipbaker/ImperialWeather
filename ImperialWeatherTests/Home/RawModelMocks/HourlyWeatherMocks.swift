//
//  HourlyWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

extension Array where Element == HourlyWeatherRaw {
    static let mock: [HourlyWeatherRaw] = [.mock_currentHour, .mock_nextHour, .mock_inTwoHours]
}

extension HourlyWeatherRaw {
    static let mock_currentHour = HourlyWeatherRaw(
        dt: .currentDateTime,
        temp: 27.0,
        weather: [
            .mock_thunderstorm,
            .mock_drizzle,
            .mock_invalidID
        ]
    )
    
    static let mock_nextHour = HourlyWeatherRaw(
        dt: .nextHour,
        temp: 29.0,
        weather: [
            .mock_drizzle,
            .mock_thunderstorm,
            .mock_invalidID
        ]
    )
    
    static let mock_inTwoHours = HourlyWeatherRaw(
        dt: .inTwoHours,
        temp: 20.0,
        weather: [
            .mock_invalidID,
            .mock_thunderstorm,
            .mock_drizzle
        ]
    )
}

extension Array where Element == HourlyWeatherPlain {
    static let mock: [HourlyWeatherPlain] = [.mock_currentHour, .mock_nextHour, .mock_inTwoHours]
}

extension HourlyWeatherPlain {
    static let mock_currentHour = HourlyWeatherPlain(
        hour: .currentDateTime,
        icon: WeatherSymbol.thunderstorm,
        temperature: 27.0
    )
    
    static let mock_nextHour = HourlyWeatherPlain(
        hour: .nextHour,
        icon: WeatherSymbol.drizzle,
        temperature: 29.0
    )
    
    static let mock_inTwoHours = HourlyWeatherPlain(
        hour: .inTwoHours,
        icon: WeatherSymbol.placeholder,
        temperature: 20.0
    )
}
