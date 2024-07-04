//
//  MockWeatherService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

final class MockWeatherService: WeatherService {
    func fetchWeather(for latitude: String, and longitude: String) async throws -> HomeWeatherRaw {
        return HomeWeatherRaw.mock
    }
}
