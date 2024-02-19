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
            .mock_drizzle,
            .mock_invalidID,
            .mock_thunderstorm
        ]
    )
    
    public static let mock_withNilLocation = CurrentWeatherRaw(
        name: nil,
        main: .mock,
        weather: [
            .mock_thunderstorm,
            .mock_drizzle
        ]
    )
}

extension CurrentWeatherPlain {
    public static let mock = CurrentWeatherPlain(
        icon: WeatherSymbol.drizzle,
        location: "London",
        description: WeatherDescription.drizzle,
        temperature: 21.0
    )
    
    public static let mock_withNilLocation = CurrentWeatherPlain(
        icon: WeatherSymbol.thunderstorm,
        location: WeatherLabel.unknownLocation,
        description: WeatherDescription.thunderstorm,
        temperature: 21.0
    )
}
