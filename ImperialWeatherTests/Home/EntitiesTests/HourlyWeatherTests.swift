//
//  HourlyWeatherTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 01/07/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.dataMapping, .entities))
struct HourlyWeatherTests {
    @Test func mapHourlyWeatherfromData() {
        let hourlyWeather = HourlyWeather.mapHourlyWeatherFromData(data: [HourlyWeatherPlain].mock)
        #expect(hourlyWeather == [HourlyWeather].mock)
    }
}
