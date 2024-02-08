//
//  CurrentWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import XCTest

final class CurrentWeatherRawTests: XCTestCase {

    func test_mapToPlain_shouldMapCurrentWeatherRaw_toCurrentWeatherPlain() {
        let result = currentWeatherRaw.mapToPlain()
        XCTAssertEqual(currentWeatherPlain, result)
    }
    
    func test_mapToPlain_shouldMapCurrentWeatherRaw_toCurrentWeatherPlain_withNoLocation() {
        let result = currentWeatherRawNoLocation.mapToPlain()
        XCTAssertEqual(currentWeatherPlainNoLocation, result)
    }
}
