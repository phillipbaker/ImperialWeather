//
//  TemperatureScalePicker.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct TemperatureScalePicker: View {
    @AppStorage("temperatureScale") private var scale: TemperatureScale = .celsius

    var body: some View {
        Picker(WeatherLabel.temperatureScalePicker, selection: $scale) {
            Group {
                Text(UnitTemperature.celsius.symbol)
                    .tag(TemperatureScale.celsius)
                    .accessibilityLabel(WeatherLabel.celsius)

                Text(UnitTemperature.fahrenheit.symbol)
                    .tag(TemperatureScale.fahrenheit)
                    .accessibilityLabel(WeatherLabel.fahrenheit)
            }
            .opacity(0.9)
        }
        .accessibilityLabel(WeatherLabel.temperatureScalePicker)
        .pickerStyle(.segmented)
    }
}

#Preview {
    ZStack {
        Color.classicBackground
            .ignoresSafeArea()

        TemperatureScalePicker()
            .padding()
    }
}
