//
//  TemperatureScaleTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/07/2024.
//

@testable import ImperialWeather
import Testing

struct TemperatureScaleTests {
    @Test func idEqualsRawValue() {
        let celsius = TemperatureScale.celsius
        #expect(celsius.id == 0)

        let fahrenheit = TemperatureScale.fahrenheit
        #expect(fahrenheit.id == 1)
    }
}
