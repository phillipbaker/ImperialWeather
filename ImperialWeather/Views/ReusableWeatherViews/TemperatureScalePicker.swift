//
//  TemperatureScalePicker.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct TemperatureScalePicker: View {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius

    var body: some View {
        Picker(WeatherLabel.temperatureScalePicker, selection: $temperatureScale) {
            Group {
                Text(UnitTemperature.celsius.symbol)
                    .tag(TemperatureScale.celsius)
                    .accessibilityLabel(WeatherLabel.celsius)
                Text(UnitTemperature.fahrenheit.symbol)
                    .tag(TemperatureScale.fahrenheit)
                    .accessibilityLabel(WeatherLabel.fahrenheit)
            }
        }
        .accessibilityLabel(WeatherLabel.temperatureScalePicker)
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct TemperatureScalePicker_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureScalePicker()
    }
}
