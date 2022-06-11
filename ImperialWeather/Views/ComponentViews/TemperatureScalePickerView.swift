//
//  TemperatureScalePickerView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct TemperatureScalePickerView: View {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius

    var body: some View {
        Picker("Temperature Scale Picker", selection: $temperatureScale) {
            Group {
                Text(Celsius.short)
                    .tag(TemperatureScale.celsius)
                    .accessibility(label: Text(Celsius.full))
                Text(Fahrenheit.short)
                    .tag(TemperatureScale.fahrenheit)
                    .accessibility(label: Text(Fahrenheit.full))
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct TemperatureScalePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureScalePickerView()
    }
}
