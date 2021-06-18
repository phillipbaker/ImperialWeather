//
//  Forecast.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct Wrapper<T: Decodable>: Decodable {
    let item: T
}

struct Forecast: Codable {
    let coordinates: Coordinates
    let description: [WeatherDescription]
    let conditions: Conditions
    let location: String?
}

extension Forecast {
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case description = "weather"
        case conditions = "main"
        case location = "name"
    }
}
