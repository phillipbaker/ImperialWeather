//
//  GetWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

class GetWeather {
    let locationSource: LocationDataSource
    let weatherSource: WeatherDataSource
    
    init(locationSource: LocationDataSource, weatherSource: WeatherDataSource) {
        self.locationSource = locationSource
        self.weatherSource = weatherSource
    }
    
    func weather(latitude: String, longitude: String) async throws -> HomeWeather {
        let locationName = try await locationSource.location(latitude: latitude, longitude: longitude)
        
        let currentWeather = try await weatherSource.getCurrentWeather(latitude: latitude, longitude: longitude)
        let upcomingWeather = try await weatherSource.getUpcomingWeather(latitude: latitude, longitude: longitude)

        let currentWeatherPlain = CurrentWeatherPlain(icon: currentWeather.icon, location: locationName, description: currentWeather.description, temperature: currentWeather.temperature)
        
        let homeWeatherPlain = HomeWeatherPlain(
            current: currentWeatherPlain,
            hourly: upcomingWeather.hourly,
            daily: upcomingWeather.daily)
        
        return HomeWeather.mapHomeWeatherFromData(data: homeWeatherPlain)
    }
}
