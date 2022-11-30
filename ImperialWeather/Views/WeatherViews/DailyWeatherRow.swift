//
//  DailyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct DailyWeatherRow: View {
    var dailyWeather: DailyWeatherRaw
    
    var body: some View {
        SizeCategoryStackView {
            Text(dailyWeather.day.wideWeekdayFormat)
                .frame(minWidth: 92, alignment: .leading)
                .opacity(0.9)
            
            Spacer()
            
            WeatherImageView(imageName: WeatherDescriptionRaw.mapFirstIcon(from: dailyWeather.description))
            
            Spacer()
            
            Group {
                PrimaryTemperatureView(temperature: dailyWeather.temperature.max).opacity(0.9)
                SecondaryTemperatureView(temperature: dailyWeather.temperature.max)
            }
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.trailing)
        }
    }
}

struct DailyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherRow(dailyWeather: DailyWeatherRaw.preview.first!)
    }
}
