//
//  HourlyWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

extension Array where Element == HourlyWeatherRaw {
    static let mock: [HourlyWeatherRaw] = [.currentHourMock, .nextHourMock, .inTwoHoursMock]
}

extension HourlyWeatherRaw {
    static let currentHourMock = HourlyWeatherRaw(
        dt: .currentDateTime,
        temp: 27.0,
        weather: [
            .thunderstormMock,
            .drizzleMock,
            .invalidIdMock
        ]
    )

    static let nextHourMock = HourlyWeatherRaw(
        dt: .nextHour,
        temp: 29.0,
        weather: [
            .drizzleMock,
            .thunderstormMock,
            .invalidIdMock
        ]
    )

    static let inTwoHoursMock = HourlyWeatherRaw(
        dt: .inTwoHours,
        temp: 20.0,
        weather: [
            .invalidIdMock,
            .thunderstormMock,
            .drizzleMock
        ]
    )
}

extension Array where Element == HourlyWeatherPlain {
    static let mock: [HourlyWeatherPlain] = [.currentHourMock, .nextHourMock, .inTwoHoursMock]
}

extension HourlyWeatherPlain {
    static let currentHourMock = HourlyWeatherPlain(
        hour: .currentDateTime,
        icon: WeatherSymbol.thunderstorm.rawValue,
        temperature: 27.0
    )

    static let nextHourMock = HourlyWeatherPlain(
        hour: .nextHour,
        icon: WeatherSymbol.drizzle.rawValue,
        temperature: 29.0
    )

    static let inTwoHoursMock = HourlyWeatherPlain(
        hour: .inTwoHours,
        icon: WeatherSymbol.invalidId.rawValue,
        temperature: 20.0
    )
}

extension Array where Element == HourlyWeather {
    static let mock: [HourlyWeather] = [.currentHourMock, .nextHourMock, .inTwoHoursMock]
}

extension HourlyWeather {
    static let currentHourMock = HourlyWeather(
        hour: .currentDateTime,
        icon: WeatherSymbol.thunderstorm.rawValue,
        celsius: Measurement(value: 27.0, unit: .celsius)
    )

    static let nextHourMock = HourlyWeather(
        hour: .nextHour,
        icon: WeatherSymbol.drizzle.rawValue,
        celsius: Measurement(value: 29.0, unit: .celsius)
    )

    static let inTwoHoursMock = HourlyWeather(
        hour: .inTwoHours,
        icon: WeatherSymbol.invalidId.rawValue,
        celsius: Measurement(value: 20.0, unit: .celsius)
    )
}
