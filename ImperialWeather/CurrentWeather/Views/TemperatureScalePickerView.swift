//
//  TemperatureScalePickerView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

enum TemperatureScale: Int {
    case celsius
    case fahrenheit
    
    var id: Int { rawValue }
}

struct TemperatureScalePickerView: View {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    
    var body: some View {
        Picker("Temperature Scale Picker", selection: $temperatureScale) {
            Group {
                Text("ºC")
                    .tag(TemperatureScale.celsius)
                    .accessibility(label: Text("Celsius"))
                Text("ºF")
                    .tag(TemperatureScale.fahrenheit)
                    .accessibility(label: Text("Fahrenheit"))
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
