//
//  PrimaryTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct PrimaryTemperatureView: View {
    @AppStorage("temperatureScale") private var scale: TemperatureScale = .celsius
    
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    var alignment: Alignment = .center
    
    var body: some View {
        Text(temperature.formatted)
            .frame(minWidth: 50, alignment: alignment)
            .monospacedDigit()
            .opacity(0.9)
    }
    
    private var temperature: Measurement<UnitTemperature> {
        return scale == .celsius ? celsius : fahrenheit
    }
    
}

#Preview {
    PrimaryTemperatureView(
        celsius: Measurement(value: 21.0, unit: .celsius),
        fahrenheit: Measurement(value: 39.0, unit: .fahrenheit)
    )
}
