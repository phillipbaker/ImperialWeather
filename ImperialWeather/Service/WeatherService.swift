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
            throw NetworkingError.invalidResponse
        }

        guard let decodedCurrentWeather = try? JSONDecoder().decode(CurrentWeather.self, from: data) else {
            throw NetworkingError.invalidData
        }
        
        return decodedCurrentWeather
    }
    
    func fetchUpcomingWeather(for location: CLLocationCoordinate2D) async throws -> UpcomingWeather {
        let resource = UpcomingWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        
        let (data, response) = try await URLSession.shared.data(from: resource.url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard var decodedUpcomingWeather = try? decoder.decode(UpcomingWeather.self, from: data) else {
            throw NetworkingError.invalidData
        }
        
        /// Remove the current day from the daily forecast data
        let forecast = decodedUpcomingWeather.removeCurrentDayFromDailyWeather()
        
        return forecast
    }
}
