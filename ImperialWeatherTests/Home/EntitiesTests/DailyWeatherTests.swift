//
//  Untitled.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 01/07/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.dataMapping, .entities))
struct DailyWeatherTests {
    @Test func mapDailyWeatherFromData() {
        let dailyWeather = DailyWeather.mapDailyWeatherFromData(data: [DailyWeatherPlain].mock)
        #expect(dailyWeather == [DailyWeather].mock)
    }
}
