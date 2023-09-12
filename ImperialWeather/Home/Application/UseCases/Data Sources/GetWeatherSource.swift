//
//  GetWeatherSource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

protocol GetWeatherSource {
    func weather(forLatitude latitude: String, andLongitude longitude: String) async throws -> HomeWeatherLocationPlain
}
