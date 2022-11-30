//
//  HourlyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct HourlyWeatherRow: View {
    var hourlyWeather: HourlyWeatherRaw
    
    var body: some View {
        VStack(spacing: 16) {
            Text(hourlyWeather.hour.nowHourFormat)
                .frame(minWidth: 44)
                .font(.callout)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            
            WeatherImageView(imageName: WeatherDescriptionRaw.mapFirstIcon(from: hourlyWeather.description))
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
        HourlyWeatherRow(hourlyWeather: HourlyWeatherRaw.preview.first!)
    }
}
