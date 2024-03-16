//
//  PlottableMeasurement.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/28/23.
//

import Charts
import Foundation

struct PlottableCelsius<UnitType: Unit>: Sendable where UnitType: Sendable {
    let measurement: Measurement<UnitType>
}

extension PlottableCelsius: Plottable where UnitType == UnitTemperature {
    var primitivePlottable: Double {
        self.measurement.converted(to: .celsius).value
    }
    
    init?(primitivePlottable: Double) {
        self.init(measurement:
                    Measurement(
            value: primitivePlottable,
            unit: .celsius)
        )
    }
}

struct PlottableFahrenheit<UnitType: Unit>: Sendable where UnitType: Sendable {
    let measurement: Measurement<UnitType>
}

extension PlottableFahrenheit: Plottable where UnitType == UnitTemperature {
    var primitivePlottable: Double {
        self.measurement.converted(to: .fahrenheit).value
    }
    
    init?(primitivePlottable: Double) {
        self.init(measurement: Measurement(
            value: primitivePlottable,
            unit: .fahrenheit)
        )
    }
}
