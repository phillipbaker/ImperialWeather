//
//  HourlyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct HourlyWeatherRow: View {
    var hourlyWeather: HourlyWeather

    var body: some View {
        VStack(spacing: 16) {
            Text(hourlyWeather.hour.narrowHour)
                .frame(minWidth: 44)
                .font(.subheadline)
                .textCase(.uppercase)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)

            WeatherImage(systemName: hourlyWeather.icon)
                .frame(minWidth: 28, minHeight: 50, alignment: .top)
                .font(.title)

            VStack(spacing: 4) {
                PrimaryTemperatureView(
                    celsius: hourlyWeather.celsius,
                    fahrenheit: hourlyWeather.fahrenheit
                )

                SecondaryTemperatureView(
                    celsius: hourlyWeather.celsius,
                    fahrenheit: hourlyWeather.fahrenheit
                )
            }
        }
        .fontWeight(.semibold)
        .opacity(0.8)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    HourlyWeatherRow(hourlyWeather: .currentHourPreview)
}
