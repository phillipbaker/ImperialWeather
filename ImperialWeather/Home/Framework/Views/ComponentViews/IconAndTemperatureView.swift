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
        HStack(spacing: 8) {
            WeatherImage(systemName: icon)
                .font(.system(size: 60))

            VStack(alignment: .leading, spacing: 0) {
                PrimaryTemperatureView(
                    celsius: celsius,
                    fahrenheit: fahrenheit,
                    alignment: .leading
                )

                SecondaryTemperatureView(
                    celsius: celsius,
                    fahrenheit: fahrenheit,
                    alignment: .leading
                )
            }
            .font(.title)
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
