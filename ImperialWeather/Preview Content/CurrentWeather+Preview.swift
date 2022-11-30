//
//  CurrentWeatherRaw+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension CurrentWeatherRaw {
    static let preview: CurrentWeatherRaw = .init(
        location: "Test Location",
        conditions: ConditionsRaw(temperature: 100.0),
        description: [WeatherDescriptionRaw.preview]
    )
}
