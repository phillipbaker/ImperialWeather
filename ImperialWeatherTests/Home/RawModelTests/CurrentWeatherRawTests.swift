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
        let result = CurrentWeatherRaw.mock.mapToPlain()
        XCTAssertEqual(CurrentWeatherPlain.mock, result)
    }
    
    func test_mapToPlain_shouldMapCurrentWeatherRaw_toCurrentWeatherPlain_withNilLocation() {
        let result = CurrentWeatherRaw.mock_withNilLocation.mapToPlain()
        XCTAssertEqual(CurrentWeatherPlain.mock_withNilLocation, result)
    }
}
