//
//  DailyWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import XCTest

final class DailyWeatherRawTests: XCTestCase {
    
    func test_mapToPlain_shouldMapDailyWeatherRaw_toDailyWeatherPlain() {
        let result = DailyWeatherRaw.mock_today.mapToPlain()
        XCTAssertEqual(DailyWeatherPlain.mock_today, result)
    }
    
    func test_mapDailyWeatherRawToPlain_shouldMapArrayOfDailyWeatherRaw_toArrayOfDailyWeatherPlain() {
        let result = DailyWeatherRaw.mapDailyWeatherRawToPlain(
            dailyWeatherRaw: [
                .mock_tomorrow,
                .mock_inTwoDays
            ]
        )
        
        XCTAssertEqual([DailyWeatherPlain.mock_tomorrow, DailyWeatherPlain.mock_inTwoDays], result)
    }
    
    func test_mapDailyWeatherRawToPlain_shouldMapArrayOfDailyWeatherRaw_toArrayOfDailyWeatherPlain_excludingTodayForecast() {
        let result = DailyWeatherRaw.mapDailyWeatherRawToPlain(
            dailyWeatherRaw: [
                .mock_today,
                .mock_tomorrow
            ]
        )
        
        XCTAssertEqual([DailyWeatherPlain.mock_tomorrow], result)
    }
}
