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
        icon: WeatherIcon.cloud,
        location: "Test Location",
        description: "Sunny",
        temperature: 21.0
    )
}
