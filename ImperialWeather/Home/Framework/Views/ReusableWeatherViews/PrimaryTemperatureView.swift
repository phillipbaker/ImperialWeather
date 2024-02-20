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
    
    var body: some View {
        Text((scale == .celsius ? celsius : fahrenheit).formatted)
            .fontWeight(.medium)
            .frame(minWidth: 40)
    }
}

struct PrimaryTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTemperatureView(
            celsius: Measurement(value: 21.0, unit: .celsius),
            fahrenheit: Measurement(value: 39.0, unit: .fahrenheit)
        )
    }
}
