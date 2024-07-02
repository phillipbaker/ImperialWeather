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
    static let mock = CurrentWeatherPlain(
        icon: WeatherSymbol.drizzle.rawValue,
        location: "London",
        description: WeatherDescription.drizzle,
        temperature: 21.0
    )
    
    static let nilLocationMock = CurrentWeatherPlain(
        icon: WeatherSymbol.thunderstorm.rawValue,
        location: WeatherLabel.unknownLocation,
        description: WeatherDescription.thunderstorm,
        temperature: 21.0
    )
}

extension CurrentWeather {
    static let mock = CurrentWeather(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!,
        icon: WeatherSymbol.drizzle.rawValue,
        location: "London",
        description: WeatherDescription.drizzle,
        celsius: Measurement(value: 21.0, unit: .celsius)
    )
    
    static let nilLocationMock = CurrentWeather(
        id: UUID(uuidString: "00000000-0000-0000-000000000000")!,
        icon: WeatherSymbol.thunderstorm.rawValue,
        location: WeatherLabel.unknownLocation,
        description: WeatherDescription.thunderstorm,
        celsius: Measurement(value: 21.0, unit: .celsius)
    )
}
