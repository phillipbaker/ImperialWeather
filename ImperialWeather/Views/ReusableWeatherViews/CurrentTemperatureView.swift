//
//  CurrentTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import SwiftUI

struct CurrentTemperatureView: View {
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            PrimaryTemperatureView(celsius: celsius, fahrenheit: fahrenheit)
                .font(.largeTitle)
                .opacity(0.9)
            
            SecondaryTemperatureView(celsius: celsius, fahrenheit: fahrenheit)
        }
        .accessibilityElement(children: .combine)
    }
}
