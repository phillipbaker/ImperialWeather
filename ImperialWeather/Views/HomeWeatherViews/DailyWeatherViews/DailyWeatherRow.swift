//
//  DailyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct DailyWeatherRow: View {
    let dailyWeather: DailyWeather
    
    var body: some View {
        SizeCategoryStack {
            Text(dailyWeather.day.wideWeekday)
                .frame(minWidth: 92, alignment: .leading)
                .opacity(0.9)
            
            Spacer()
            
            WeatherImage(systemName: dailyWeather.icon)
            
            Spacer()
            
            Group {
                PrimaryTemperatureView(temperature: dailyWeather.temperature).opacity(0.9)
                SecondaryTemperatureView(temperature: dailyWeather.temperature)
            }
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.trailing)
        }
    }
}

struct DailyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherRow(dailyWeather: DailyWeather.preview.first!)
    }
}
