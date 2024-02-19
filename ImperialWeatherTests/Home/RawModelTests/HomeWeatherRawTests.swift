//
//  HomeWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import XCTest

final class HomeWeatherRawTests: XCTestCase {
    
    func test_mapToPlain_shouldMapHomeWeatherRaw_toHomeWeatherPlain() {
        let result = HomeWeatherRaw.mock.mapToPlain()
        XCTAssertEqual(HomeWeatherPlain.mock, result)
    }
}
