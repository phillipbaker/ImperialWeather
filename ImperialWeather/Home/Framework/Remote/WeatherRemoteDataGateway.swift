//
//  WeatherRemoteDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class WeatherRemoteDataGateway: WeatherDataSourceRemote {
    let service: WeatherService
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func fetchWeather(for latitude: String, and longitude: String) async throws -> HomeWeatherPlain {
        return try await service.fetchWeather(for: latitude, and: longitude).mapToPlain()
    }
}
