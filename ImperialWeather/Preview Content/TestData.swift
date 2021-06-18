//
//  TestData.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct TestData {
    static let coordinates = Coordinates(longitude: 42.0, latitude: 23.0)
    static let currentWeather = [WeatherDescription(id: 201, description: "Clear")]
    static let conditions = Conditions(temperature: 12.0)
    static let location = "Joydens Wood"
    
    static let forecast = Forecast(
        coordinates: coordinates, description: currentWeather, conditions: conditions, location: location
    )
}
