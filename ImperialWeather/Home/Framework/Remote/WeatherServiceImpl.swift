//
//  WeatherServiceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class WeatherServiceImpl: WeatherService {
    func fetchWeather(latitude: String, longitude: String) async throws -> HomeWeatherRaw {
        let currentWeatherResource = CurrentWeatherResource(latitude: latitude, longitude: longitude)
        let currentWeatherRequest = APIRequest(resource: currentWeatherResource)
        
        guard let currentWeatherRaw = try await currentWeatherRequest.execute() else {
            throw NetworkingError.invalidData
        }
        
        let upcomingWeatherResource = UpcomingWeatherResource(latitude: latitude, longitude: longitude)
        let upcomingWeatherRequest = APIRequest(resource: upcomingWeatherResource)
        
        guard let upcomingWeatherRaw = try await upcomingWeatherRequest.execute() else {
            throw NetworkingError.invalidData
        }
        
        return HomeWeatherRaw(
            currentWeather: currentWeatherRaw,
            hourlyWeather: upcomingWeatherRaw.hourly,
            dailyWeather: upcomingWeatherRaw.daily
        )
    }
}
