//
//  DailyWeatherRow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct DailyWeatherRow: View {
    var day: DailyWeather
    
    var body: some View {
        SizeCategoryStackView {
            Text(day.inDayFormat)
                .frame(minWidth: 92, alignment: .leading)
                .opacity(0.9)
            
            Spacer()
            
            WeatherImageView(imageName: day.description.first?.conditionName ?? WeatherIcon.dashedSquare)
            
            Spacer()
            
            Group {
                PrimaryTemperatureView(temperature: day.temperature.max).opacity(0.9)
                SecondaryTemperatureView(temperature: day.temperature.max)
            }
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.trailing)
        }
    }
}

struct DailyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherRow(day: PreviewData.daily.first!)
    }
}
