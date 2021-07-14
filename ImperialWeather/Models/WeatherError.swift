//
//  WeatherError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum WeatherError: Error {
    case badLocation
    case networkError
    case invalidResponse
    case invalidData
}
