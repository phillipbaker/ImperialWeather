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
        let result = dailyWeatherRawToday.mapToPlain()
        XCTAssertEqual(dailyWeatherPlainToday, result)
    }
    
    func test_mapDailyWeatherRawToPlain_shouldMapArrayOfDailyWeatherRaw_toArrayOfDailyWeatherPlain() {
        let result = DailyWeatherRaw
            .mapDailyWeatherRawToPlain(
                dailyWeatherRaw: [
                    dailyWeatherRawTomorrow,
                    dailyWeatherRawInTwoDays
                ]
            )
        
        XCTAssertEqual([dailyWeatherPlainTomorrow, dailyWeatherPlainInTwoDays], result)
    }
    
    func test_mapDailyWeatherRawToPlain_shouldMapArrayOfDailyWeatherRaw_toArrayOfDailyWeatherPlain_excludingTodayForecast() {
        let result = DailyWeatherRaw
            .mapDailyWeatherRawToPlain(
                dailyWeatherRaw: [
                    dailyWeatherRawToday,
                    dailyWeatherRawTomorrow
                ]
            )
        
        XCTAssertEqual([dailyWeatherPlainTomorrow], result)
    }
}
