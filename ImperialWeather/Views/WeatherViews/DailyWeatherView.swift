//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("7-Day Forecast")
                    .font(.caption)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            if let dailyWeather = viewModel.upcomingWeather?.dailyWeather {
                ForEach(dailyWeather) { day in
                    Divider()
                    SizeCategoryStackView {
                        Text(day.inDayFormat)
                            .frame(minWidth: 92, alignment: .leading)
                        
                        Spacer()
                        
                        WeatherImageView(name: day.description.first?.conditionName ?? WeatherIcon.dashedSquare)
                        
                        Spacer()
                        
                        HStack {
                            PrimaryTemperatureView(temperature: day.temperature.max)
                            SecondaryTemperatureView(temperature: day.temperature.max)
                        }
                        .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
        .paneBackground()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(viewModel: WeatherViewModel())
    }
}
