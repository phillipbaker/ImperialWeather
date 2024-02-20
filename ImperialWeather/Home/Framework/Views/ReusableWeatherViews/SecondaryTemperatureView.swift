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
    
    var body: some View {
        Text((scale == .fahrenheit ? celsius : fahrenheit).formatted)
            .foregroundColor(.secondary)
            .frame(minWidth: 40)
    }
}

struct SecondaryTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryTemperatureView(
            celsius: Measurement(value: 15.0, unit: .celsius),
            fahrenheit: Measurement(value: 32.0, unit: .fahrenheit)
        )
    }
}
