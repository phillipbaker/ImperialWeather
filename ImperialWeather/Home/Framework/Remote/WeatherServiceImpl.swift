//
//  WeatherServiceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class WeatherServiceImpl: WeatherService {
    func fetchWeather(for latitude: String, and longitude: String) async throws -> HomeWeatherRaw {
        let currentWeatherResource = CurrentWeatherResource(latitude: latitude, longitude: longitude)
        let currentWeatherRequest = APIRequest(resource: currentWeatherResource)

        let upcomingWeatherResource = UpcomingWeatherResource(latitude: latitude, longitude: longitude)
        let upcomingWeatherRequest = APIRequest(resource: upcomingWeatherResource)

        async let currentWeatherRaw = currentWeatherRequest.execute()
        async let upcomingWeatherRaw = upcomingWeatherRequest.execute()

        return try await HomeWeatherRaw(
            currentWeather: currentWeatherRaw,
            hourlyWeather: upcomingWeatherRaw.hourly,
            dailyWeather: upcomingWeatherRaw.daily
        )
    }
}
