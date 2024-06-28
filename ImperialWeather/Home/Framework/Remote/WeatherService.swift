//
//  WeatherService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

protocol WeatherService: Sendable {
    func fetchWeather(for latitude: String, and longitude: String) async throws -> HomeWeatherRaw
}
