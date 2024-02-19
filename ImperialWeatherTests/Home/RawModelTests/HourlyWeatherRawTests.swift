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
        let result = HourlyWeatherRaw.mock_currentHour.mapToPlain()
        XCTAssertEqual(.mock_currentHour, result)
    }
    
    func test_mapHourlyWeatherRawToPlain_shouldMapArrayOfHourlyWeatherRaw_toArrayOfHourlyWeatherPlain() {
        let result = HourlyWeatherRaw.mapHourlyWeatherRawToPlain(
            hourlyWeatherRaw: [
                .mock_currentHour,
                .mock_nextHour,
                .mock_inTwoHours
            ]
        )
        XCTAssertEqual(.mock, result)
    }
}
