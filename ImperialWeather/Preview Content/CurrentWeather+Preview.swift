//
//  CurrentWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension CurrentWeather {
    static let preview: CurrentWeather = .init(
        coordinates: Coordinates(longitude: 0.0, latitude: 0.0),
        description: [WeatherDescription.preview],
        conditions: Conditions(temperature: 100.0),
        location: "Test Location"
    )
}
