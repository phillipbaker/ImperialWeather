//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    var weather: CurrentWeather

    var body: some View {
        VStack(spacing: 32) {
            VerticalSizeClassStack(spacing: 32) {
                LocationAndDescriptionView(weather: weather)
                
                HStack(spacing: 16) {
                    IconAndTemperatureView(icon: weather.icon, celsius: weather.celsius, fahrenheit: weather.fahrenheit)
                }
            }
            .accessibilityElement(children: .combine)
            
            TemperatureScalePicker()
        }
        .padding(.top)
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weather: .preview)
            .padding()
            .backgroundView()
    }
}
