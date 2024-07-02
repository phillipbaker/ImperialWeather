//
//  HourlyWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.rawModels, .dataMapping))
struct HourlyWeatherRawTests {
    @Test func mapHourlyWeatherRawToPlain() {
        #expect(HourlyWeatherRaw.currentHourMock.mapToPlain() == HourlyWeatherPlain.currentHourMock)
    }
    
    @Test func mapArrayOfHoulyWeatherRawToPlain() {
        let mappedHourlyWeatherRawMock = HourlyWeatherRaw.mapHourlyWeatherRawToPlain(hourlyWeatherRaw: .mock)
        #expect(mappedHourlyWeatherRawMock == [HourlyWeatherPlain].mock)
    }
}
