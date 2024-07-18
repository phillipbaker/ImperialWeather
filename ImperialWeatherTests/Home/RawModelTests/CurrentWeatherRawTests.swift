//
//  CurrentWeatherRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.rawModels, .dataMapping))
struct CurrentWeatherRawTests {
    @Test func mapCurrentWeatherRawToPlain() {
        #expect(CurrentWeatherRaw.mock.mapToPlain() == CurrentWeatherPlain.mock)
    }

    @Test func mapCurrentWeatherRawToPlainWithNilLocation() {
        #expect(CurrentWeatherRaw.nilLocationMock.mapToPlain() == CurrentWeatherPlain.nilLocationMock)
    }
}
