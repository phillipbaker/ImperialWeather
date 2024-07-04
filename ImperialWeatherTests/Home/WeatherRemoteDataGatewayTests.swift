//
//  WeatherRemoteDataGatewayTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct WeatherRemoteDataGatewayTests {
    @Test func fetchWeather() async throws {
        let weatherRemoteDataGateway = WeatherRemoteDataGateway(service: MockWeatherService())
        let plain = try await weatherRemoteDataGateway.fetchWeather(for: "0.0", and: "0.0")
        #expect(plain == HomeWeatherPlain.mock)
    }
}
