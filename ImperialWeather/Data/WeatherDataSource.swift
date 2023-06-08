//
//  WeatherDataSource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/6/23.
//

import Foundation

class WeatherDataSource {
    func getCurrentWeather(latitude: String, longitude: String) async throws -> CurrentWeatherPlain {
        let currentWeatherResource = CurrentWeatherResource(latitude: latitude, longitude: longitude)
        let currentRequest = APIRequest(resource: currentWeatherResource)
        
        guard let currentWeather = try await currentRequest.execute()?.mapToPlain() else {
            throw NetworkingError.invalidData
        }
        
        return currentWeather
    }
    
    func getUpcomingWeather(latitude: String, longitude: String) async throws -> UpcomingWeatherPlain {
        let upcomingWeatherResource = UpcomingWeatherResource(latitude: latitude, longitude: longitude)
        let upcomingRequest = APIRequest(resource: upcomingWeatherResource)
        
        guard let upcomingWeather = try await upcomingRequest.execute()?.mapToPlain() else {
            throw NetworkingError.invalidData
        }
        
        return upcomingWeather
    }
}
