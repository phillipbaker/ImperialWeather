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
                Text(Degrees.c)
                    .tag(TemperatureScale.celsius)
                    .accessibility(label: Text(Degrees.celsius))
                Text(Degrees.f)
                    .tag(TemperatureScale.fahrenheit)
                    .accessibility(label: Text(Degrees.fahrenheit))
            }
        }
        .frame(width: 128)
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct TemperatureScalePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureScalePickerView()
    }
}
