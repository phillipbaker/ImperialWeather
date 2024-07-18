//
//  DailyWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.rawModels, .dataMapping))
struct DailyWeatherRawTests {
    @Test func mapDailyWeatherRawToPlain() {
        #expect(DailyWeatherRaw.todayMock.mapToPlain() == DailyWeatherPlain.todayMock)
    }

    @Test func mapArrayofDailyWeatherRawToPlain() {
        let mappedDailyWeatherRawMock = DailyWeatherRaw.mapDailyWeatherRawToPlain(
            dailyWeatherRaw: [.tomorrowMock, .inTwoDaysMock]
        )
        #expect(mappedDailyWeatherRawMock == [DailyWeatherPlain.tomorrowMock, DailyWeatherPlain.inTwoDaysMock])
    }

    @Test func mapArrayofDailyWeatherRawToPlainExcludingCurrentDay() {
        let mappedDailyWeatherRawMockWithCurrentDay = DailyWeatherRaw.mapDailyWeatherRawToPlain(
            dailyWeatherRaw: [DailyWeatherRaw].mock
        )
        #expect(mappedDailyWeatherRawMockWithCurrentDay == [DailyWeatherPlain].mock)
    }
}
