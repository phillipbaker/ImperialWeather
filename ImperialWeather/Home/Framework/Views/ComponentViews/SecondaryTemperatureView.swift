//
//  SecondaryTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct SecondaryTemperatureView: View {
    @AppStorage("temperatureScale") private var scale: TemperatureScale = .celsius
    
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    var alignment: Alignment = .center
    
    var body: some View {
        Text(temperature.abbreviated)
            .frame(minWidth: 50, alignment: alignment)
            .monospacedDigit()
            .foregroundStyle(.secondary)
    }
    
    private var temperature: Measurement<UnitTemperature> {
        return scale == .celsius ? fahrenheit : celsius
    }
}

#Preview {
    SecondaryTemperatureView(
        celsius: Measurement(value: 15.0, unit: .celsius),
        fahrenheit: Measurement(value: 32.0, unit: .fahrenheit)
    )
}
