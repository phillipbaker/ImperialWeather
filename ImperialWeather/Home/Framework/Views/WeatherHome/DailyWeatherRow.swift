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
                    .frame(minWidth: 100, alignment: .leading)
                    .fontWeight(.medium)
                    .opacity(0.9)
                
                Spacer()
                
                WeatherImage(systemName: dailyWeather.icon)
                
                Spacer()
                
                PrimaryTemperatureView(
                    celsius: dailyWeather.celsius,
                    fahrenheit: dailyWeather.fahrenheit
                )
                .frame(minWidth: 50, alignment: .trailing)
                .fontWeight(.medium)
                
                SecondaryTemperatureView(
                    celsius: dailyWeather.celsius,
                    fahrenheit: dailyWeather.fahrenheit
                )
                .frame(minWidth: 50, alignment: .trailing)
                .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: dynamicTypeSize.isAccessibilitySize ? .center : .trailing)
        }
    }
}

#Preview {
    DailyWeatherRow(dailyWeather: .preview_today)
}
