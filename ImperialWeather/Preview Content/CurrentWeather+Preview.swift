//
//  CurrentWeatherRaw+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension CurrentWeatherRaw {
    static let preview: CurrentWeatherRaw = .init(
        coordinates: CoordinatesRaw(longitude: 0.0, latitude: 0.0),
        description: [WeatherDescriptionRaw.preview],
        conditions: ConditionsRaw(temperature: 100.0),
        location: "Test Location"
    )
}
