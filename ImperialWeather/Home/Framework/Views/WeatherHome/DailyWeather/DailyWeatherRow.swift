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
                PrimaryTemperatureView(celsius: dailyWeather.celsius, fahrenheit: dailyWeather.fahrenheit).opacity(0.9)
                SecondaryTemperatureView(celsius: dailyWeather.celsius, fahrenheit: dailyWeather.fahrenheit)
            }
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.trailing)
        }
        .frame(maxWidth: .infinity)
    }
}

struct DailyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherRow(dailyWeather: DailyWeather.preview.first!)
    }
}
