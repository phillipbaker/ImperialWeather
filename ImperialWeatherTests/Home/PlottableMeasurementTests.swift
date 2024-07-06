//
//  PlottableMeasurementTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/07/2024.
//

import Foundation
@testable import ImperialWeather
import Testing

struct PlottableMeasurementTests {
    @Test func plottableCelsius() {
        let plottableCelsius = PlottableCelsius(primitivePlottable: 22.0)
        #expect(plottableCelsius?.primitivePlottable == 22.0)
        #expect(plottableCelsius?.measurement == Measurement(value: 22.0, unit: .celsius))
    }
    
    @Test func plottableNegativeCelsius() {
        let plottableCelsius = PlottableCelsius(primitivePlottable: -5.0)
        #expect(plottableCelsius?.primitivePlottable == -5.0)
        #expect(plottableCelsius?.measurement == Measurement(value: -5.0, unit: .celsius))
    }
    
    @Test func plottableFahrenheit() {
        let plottableFahrenheit = PlottableFahrenheit(primitivePlottable: 65.0)
        #expect(plottableFahrenheit?.primitivePlottable == 65.0)
        #expect(plottableFahrenheit?.measurement == Measurement(value: 65.0, unit: .fahrenheit))
    }
    
    @Test func plottableNegativeFahrenheit() {
        let plottableFahrenheit = PlottableFahrenheit(primitivePlottable: -48.0)
        #expect(plottableFahrenheit?.primitivePlottable == -48.0)
        #expect(plottableFahrenheit?.measurement == Measurement(value: -48.0, unit: .fahrenheit))
    }
}
