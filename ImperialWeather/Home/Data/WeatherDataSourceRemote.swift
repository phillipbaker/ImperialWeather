//
//  WeatherDataSourceRemote.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/6/23.
//

import Foundation

protocol WeatherDataSourceRemote: Sendable {
    func fetchWeather(latitude: String, longitude: String) async throws -> HomeWeatherPlain
}
