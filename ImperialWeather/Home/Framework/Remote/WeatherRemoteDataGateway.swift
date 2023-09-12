//
//  WeatherRemoteDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

class WeatherRemoteDataGateway: WeatherDataSourceRemote {
    let service: WeatherService
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func fetchWeather(latitude: String, longitude: String) async throws -> HomeWeatherPlain {
        return try await service.fetchWeather(latitude: latitude, longitude: longitude).mapToPlain()
    }
}
