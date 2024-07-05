//
//  MockWeatherRemoteDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

final class MockWeatherRemoteDataGateway: WeatherDataSourceRemote {
    func fetchWeather(for latitude: String, and longitude: String) async throws -> HomeWeatherPlain {
        return HomeWeatherPlain.mock
    }
}
