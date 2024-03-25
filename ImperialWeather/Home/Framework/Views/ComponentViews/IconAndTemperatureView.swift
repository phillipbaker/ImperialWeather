//
//  IconAndTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 2/9/23.
//

import SwiftUI

struct IconAndTemperatureView: View {
    let icon: String
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    
    var body: some View {
        HStack(spacing: 20) {
            WeatherImage(systemName: icon)
                .font(.system(size: 60))
            
            VStack(alignment: .leading, spacing: 4) {
                PrimaryTemperatureView(
                    celsius: celsius,
                    fahrenheit: fahrenheit,
                    alignment: .leading
                )
                .font(.largeTitle)
                
                SecondaryTemperatureView(
                    celsius: celsius,
                    fahrenheit: fahrenheit,
                    alignment: .leading
                )
                .font(.subheadline)
            }
            .fontWeight(.semibold)
            .accessibilityElement(children: .combine)
        }
    }
}

#Preview {
    ZStack {
        Color.classicBackground
            .ignoresSafeArea()
        IconAndTemperatureView(
            icon: CurrentWeather.preview.icon,
            celsius: CurrentWeather.preview.celsius,
            fahrenheit: CurrentWeather.preview.fahrenheit
        )
        .paneBackground()
    }
}
