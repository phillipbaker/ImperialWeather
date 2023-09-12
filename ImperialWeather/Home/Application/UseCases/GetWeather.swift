//
//  GetWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

class GetWeather {
    let source: GetWeatherSource
    
    init(source: GetWeatherSource) {
        self.source = source
    }
    
    func weather(forLatitude latitude: String, andLongitude longitude: String) async throws -> HomeWeather {
        HomeWeather.mapHomeWeatherFromData(data: try await source.weather(forLatitude: latitude, andLongitude: longitude))
    }
}
