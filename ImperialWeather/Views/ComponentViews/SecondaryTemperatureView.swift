//
//  SecondaryTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct SecondaryTemperatureView: View {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius

    var temperature: Double

    var body: some View {
        Text(temperatureScale == .fahrenheit
             ? temperature.celsius + Celsius.short
             : temperature.fahrenheit + Fahrenheit.short
        )
        .foregroundColor(.secondary)
        .frame(minWidth: 40)
        .accessibilityLabel()
    }
}

struct SecondaryTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryTemperatureView(temperature: 15.0)
    }
}
