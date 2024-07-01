//
//  HomeWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.rawModels, .dataMappping))
struct HomeWeatherRawTests {
    @Test func mapHomeWeatherRawToPlain() {
        #expect(HomeWeatherRaw.mock.mapToPlain() == HomeWeatherPlain.mock)
    }
}
