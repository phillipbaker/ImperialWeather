//
//  WeatherService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

protocol WeatherService: Sendable {
    func fetchWeather(latitude: String, longitude: String) async throws -> HomeWeatherRaw
}
