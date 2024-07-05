//
//  GetWeatherTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct GetWeatherTests {
    @Test func weather() async throws {
        let getWeather = GetWeather(source: MockWeatherSource(response: .success))
        #expect(try await getWeather.weather() == HomeWeather.mock)
    }
}
