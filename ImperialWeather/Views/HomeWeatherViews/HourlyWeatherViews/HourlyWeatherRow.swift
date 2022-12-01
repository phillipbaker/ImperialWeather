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
                .font(.callout)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            
            WeatherImage(systemName: hourlyWeather.icon)
                .frame(minWidth: 28, minHeight: 28, alignment: .top)
                .imageScale(.large)
            
            VStack(spacing: 8) {
                PrimaryTemperatureView(temperature: hourlyWeather.temperature).opacity(0.9)
                SecondaryTemperatureView(temperature: hourlyWeather.temperature)
            }
            .font(.system(.body, design: .rounded))
        }
    }
}

struct HourlyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherRow(hourlyWeather: HourlyWeather.preview.first!)
    }
}
