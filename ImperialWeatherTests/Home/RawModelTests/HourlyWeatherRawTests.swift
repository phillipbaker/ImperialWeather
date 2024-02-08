//
//  HourlyWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import XCTest

final class HourlyWeatherRawTests: XCTestCase {
    
    func test_mapToPlain_shouldMapHourlyWeatherRaw_toHourlyWeatherPlain() {
        let result = hourlyWeatherRawCurrentHour.mapToPlain()
        XCTAssertEqual(hourlyWeatherPlainCurrentHour, result)
    }
    
    func test_mapHourlyWeatherRawToPlain_shouldMapArrayOfHourlyWeatherRaw_toArrayOfHourlyWeatherPlain() {
        let result = HourlyWeatherRaw.mapHourlyWeatherRawToPlain(
            hourlyWeatherRaw: [
                hourlyWeatherRawCurrentHour,
                hourlyWeatherNextHour,
                hourlyWeatherInTwoHours
            ]
        )
        XCTAssertEqual([hourlyWeatherPlainCurrentHour, hourlyWeatherPlainNextHour, hourlyWeatherPlainInTwoHours], result)
    }
}
