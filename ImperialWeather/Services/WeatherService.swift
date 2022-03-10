//
//  WeatherService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/5/21.
//

import CoreLocation
import Foundation

struct WeatherService {
    func fetchCurrentWeather(for location: CLLocationCoordinate2D) async throws -> CurrentWeather {
        let resource = CurrentWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        
        let (data, response) = try await URLSession.shared.data(from: resource.url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        guard let decodedData = try? JSONDecoder().decode(CurrentWeather.self, from: data) else {
            throw APIError.invalidData
        }
        
        return decodedData
    }
    
    func fetchUpcomingWeather(for location: CLLocationCoordinate2D) async throws -> UpcomingWeather {
        let resource = UpcomingWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        
        let (data, response) = try await URLSession.shared.data(from: resource.url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        guard var decodedData = try? JSONDecoder().decode(UpcomingWeather.self, from: data) else {
            throw APIError.invalidData
        }
        
        return decodedData.removeCurrentDayFromDaily()
    }
}
