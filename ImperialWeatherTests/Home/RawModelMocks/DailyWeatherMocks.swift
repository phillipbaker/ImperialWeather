//
//  DailyWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

extension Array where Element == DailyWeatherRaw {
    static let mock: [DailyWeatherRaw] = [.mock_today, .mock_tomorrow, .mock_inTwoDays]
}

extension DailyWeatherRaw {
    static let mock_today = DailyWeatherRaw(
        dt: .currentDateTime,
        temp: TemperatureRaw(max: 22.0),
        weather: [.mock_thunderstorm, .mock_drizzle, .mock_fog]
    )
    
    static let mock_tomorrow = DailyWeatherRaw(
        dt: .tomorrow,
        temp: TemperatureRaw(max: 24.0),
        weather: [.mock_drizzle, .mock_thunderstorm, .mock_haze]
    )
    
    static let mock_inTwoDays = DailyWeatherRaw(
        dt: .inTwoDays,
        temp: TemperatureRaw(max: 39.0),
        weather: [.mock_invalidID, .mock_thunderstorm, .mock_drizzle]
    )
}

extension Array where Element == DailyWeatherPlain {
    static let mock: [DailyWeatherPlain] = [.mock_tomorrow, .mock_inTwoDays]
}

extension DailyWeatherPlain {
    static let mock_today = DailyWeatherPlain(
        day: .currentDateTime,
        icon: WeatherSymbol.thunderstorm,
        temperature: 22.0
    )
    
    static let mock_tomorrow = DailyWeatherPlain(
        day: .tomorrow,
        icon: WeatherSymbol.drizzle,
        temperature: 24.0
    )
    
    static let mock_inTwoDays = DailyWeatherPlain(
        day: .inTwoDays,
        icon: WeatherSymbol.placeholder,
        temperature: 39.0
    )
}
