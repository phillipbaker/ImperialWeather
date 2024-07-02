//
//  HomeWeatherTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 01/07/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.dataMapping, .entities))
struct HomeWeatherTests {
    @Test func mapHomeWeatherFromData() {
        let homeWeather = HomeWeather.mapHomeWeatherFromData(data: HomeWeatherLocationPlain.mock)
        #expect(homeWeather == HomeWeather.mock)
    }
}
