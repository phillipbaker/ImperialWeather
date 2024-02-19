//
//  CurrentWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension CurrentWeather {
    static let preview = CurrentWeather(
        id: UUID(),
        icon: WeatherSymbol.cloud,
        location: "London",
        description: "Sunny",
        celsius: Measurement(value: 21.0, unit: .celsius)
    )
}
