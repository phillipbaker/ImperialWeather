//
//  DailyWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

extension Array where Element == DailyWeatherRaw {
    static let mock: [DailyWeatherRaw] = [.todayMock, .tomorrowMock, .inTwoDaysMock]
}

extension DailyWeatherRaw {
    static let todayMock = DailyWeatherRaw(
        dt: .currentDateTime,
        temp: TemperatureRaw(max: 22.0),
        weather: [.thunderstormMock, .drizzleMock, .fogMock]
    )
    
    static let tomorrowMock = DailyWeatherRaw(
        dt: .tomorrow,
        temp: TemperatureRaw(max: 24.0),
        weather: [.drizzleMock, .thunderstormMock, .hazeMock]
    )
    
    static let inTwoDaysMock = DailyWeatherRaw(
        dt: .inTwoDays,
        temp: TemperatureRaw(max: 39.0),
        weather: [.invalidIdMock, .thunderstormMock, .drizzleMock]
    )
}

extension Array where Element == DailyWeatherPlain {
    static let mock: [DailyWeatherPlain] = [.tomorrowMock, .inTwoDaysMock]
}

extension DailyWeatherPlain {
    static let todayMock = DailyWeatherPlain(
        day: .currentDateTime,
        icon: WeatherSymbol.thunderstorm.rawValue,
        temperature: 22.0
    )
    
    static let tomorrowMock = DailyWeatherPlain(
        day: .tomorrow,
        icon: WeatherSymbol.drizzle.rawValue,
        temperature: 24.0
    )
    
    static let inTwoDaysMock = DailyWeatherPlain(
        day: .inTwoDays,
        icon: WeatherSymbol.invalidId.rawValue,
        temperature: 39.0
    )
}
