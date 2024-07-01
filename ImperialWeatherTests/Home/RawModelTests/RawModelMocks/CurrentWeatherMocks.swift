//
//  CurrentWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

extension ConditionsRaw {
    static let mock = ConditionsRaw(temp: 21.0)
}

extension CurrentWeatherRaw {
    public static let mock = CurrentWeatherRaw(
        name: "London",
        main: .mock,
        weather: [
            .drizzleMock,
            .invalidIdMock,
            .thunderstormMock
        ]
    )
    
    static let nilLocationMock = CurrentWeatherRaw(
        name: nil,
        main: .mock,
        weather: [
            .thunderstormMock,
            .drizzleMock
        ]
    )
}

extension CurrentWeatherPlain {
    public static let mock = CurrentWeatherPlain(
        icon: WeatherSymbol.drizzle.rawValue,
        location: "London",
        description: WeatherDescription.drizzle,
        temperature: 21.0
    )
    
    public static let nilLocationMock = CurrentWeatherPlain(
        icon: WeatherSymbol.thunderstorm.rawValue,
        location: WeatherLabel.unknownLocation,
        description: WeatherDescription.thunderstorm,
        temperature: 21.0
    )
}
