//
//  CurrentWeatherTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 01/07/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.dataMapping, .entities))
struct CurrentWeatherTests {
    @Test func mapCurrentWeatherFromData() {
        let currentWeather = CurrentWeather.mapCurrentWeatherFromData(data: CurrentWeatherPlain.mock)
        #expect(currentWeather == CurrentWeather.mock)
    }
}
