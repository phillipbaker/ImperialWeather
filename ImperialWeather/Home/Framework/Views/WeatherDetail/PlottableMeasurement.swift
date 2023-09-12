//
//  PlottableMeasurement.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/28/23.
//

import Charts
import Foundation

struct PlottableMeasurement<UnitType: Unit> {
    var measurement: Measurement<UnitType>
}

extension PlottableMeasurement: Plottable where UnitType == UnitTemperature {
    var primitivePlottable: Double {
        self.measurement.converted(to: .celsius).value
    }
    
    init?(primitivePlottable: Double) {
        self.init(measurement: Measurement(
            value: primitivePlottable,
            unit: .celsius)
        )
    }
}
