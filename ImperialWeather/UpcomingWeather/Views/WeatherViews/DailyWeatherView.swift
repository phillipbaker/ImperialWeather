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
        VStack(spacing: 8) {
            ForEach(viewModel.upcomingWeather.dailyWeather) { day in
                AdaptiveStackView {
                    Text(day.inDayFormat)
                        .frame(minWidth: 92, alignment: .leading)
                    
                    AdaptiveStackView {
                        Spacer()
                        
                        WeatherImageView(name: day.description[0].conditionName)
                        
                        Spacer()
                        
                        HStack {
                            PrimaryTemperatureView(temperature: day.temperature.max)
                            SecondaryTemperatureView(temperature: day.temperature.max)
                        }
                        .multilineTextAlignment(.trailing)
                    }
                    .frame(minHeight: 28, alignment: .center)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(viewModel: WeatherViewModel())
    }
}
