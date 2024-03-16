//
//  GetWeatherSource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

protocol GetWeatherSource: Sendable {
    func weather(forLatitude latitude: String, andLongitude longitude: String) async throws -> HomeWeatherLocationPlain
}
