//
//  GetWeatherSourceImplTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct GetWeatherSourceImplTests {
    @Test func weather() async throws {
        let getWeatherSource = GetWeatherSourceImpl(
            locationDataSourceLocal: MockLocationLocalDataGateway(),
            weatherDataSourceRemote: MockWeatherRemoteDataGateway()
        )
        
        let homeWeatherLocationPlain = try await getWeatherSource.weather()
        #expect(homeWeatherLocationPlain == HomeWeatherLocationPlain.mock)
    }
}
