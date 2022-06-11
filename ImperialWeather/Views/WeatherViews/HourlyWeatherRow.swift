//
//  HourlyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct HourlyWeatherRow: View {
    var hour: HourlyWeather
    
    var body: some View {
        VStack(spacing: 16) {
            Text(hour.formattedHour)
                .frame(minWidth: 40)
                .font(.callout)
            
            WeatherImageView(imageName: hour.description.first?.conditionName ?? WeatherIcon.dashedSquare)
                .frame(minWidth: 28, minHeight: 28, alignment: .top)
            
            VStack(spacing: 8) {
                PrimaryTemperatureView(temperature: hour.temperature)
                SecondaryTemperatureView(temperature: hour.temperature)
            }
        }
    }
}

struct HourlyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherRow(hour: PreviewData.hourly.first!)
    }
}
