//
//  DailyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct DailyWeatherRow: View {
    let dailyWeather: DailyWeather
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        let layout = dynamicTypeSize.isAccessibilitySize
        ? AnyLayout(VStackLayout())
        : AnyLayout(GridLayout())

        layout {
            GridRow {
                Text(dailyWeather.day.wideWeekday)
                    .frame(
                        maxWidth: .infinity,
                        alignment: dynamicTypeSize.isAccessibilitySize ? .center : .leading
                    )
                    .opacity(0.9)

                WeatherImage(systemName: dailyWeather.icon)
                    .frame(minHeight: 32)

                HStack {
                    PrimaryTemperatureView(
                        celsius: dailyWeather.celsius,
                        fahrenheit: dailyWeather.fahrenheit,
                        alignment: .trailing
                    )

                    SecondaryTemperatureView(
                        celsius: dailyWeather.celsius,
                        fahrenheit: dailyWeather.fahrenheit,
                        alignment: .trailing
                    )
                }
                .frame(maxWidth: .infinity, alignment: dynamicTypeSize.isAccessibilitySize ? .center : .trailing)
            }
            .frame(maxWidth: .infinity)
            .fontWeight(.medium)
        }
    }
}

#Preview {
    DailyWeatherRow(dailyWeather: .todayPreview)
}
