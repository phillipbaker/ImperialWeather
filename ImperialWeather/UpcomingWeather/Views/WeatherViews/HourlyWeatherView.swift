//
//  HourlyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.upcomingWeather.hourlyWeather) { hour in
                    VStack(spacing: 16) {
                        Text(hour.formattedHour)
                            .frame(minWidth: 40)
                            .font(.callout)
                        
                        WeatherImageView(name: hour.description[0].conditionName)
                            .frame(minWidth: 28, minHeight: 28, alignment: .top)
                        
                        VStack(spacing: 8) {
                            PrimaryTemperatureView(temperature: hour.temperature)
                            SecondaryTemperatureView(temperature: hour.temperature)
                        }
                    }
                }
            }
        }
        .paneBackground()
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: WeatherViewModel())
    }
}
