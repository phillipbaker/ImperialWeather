//
//  PrimaryTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct PrimaryTemperatureView: View {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    var temperature: Double
    
    var body: some View {
        Text(temperatureScale == .celsius
                ? temperature.celsiusString + Degrees.c
                : temperature.fahrenheitString + Degrees.f)
            .fontWeight(.medium)
            .frame(minWidth: 40)
            .accessibilityLabel()
    }
}

struct PrimaryTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTemperatureView(temperature: 15.0)
    }
}
