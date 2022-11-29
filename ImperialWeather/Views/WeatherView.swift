//
//  WeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            HorizontalSizeClassStack(verticalAlignment: .top, spacing: 16) {
                VStack(spacing: 16) {
                    if let currentWeather = viewModel.currentWeather {
                        CurrentWeatherView(weather: currentWeather)
                    }
                }
                
                VStack(spacing: 16) {
                    if let upcomingWeather = viewModel.upcomingWeather {
                        HourlyWeatherView(hourlyWeather: upcomingWeather.hourlyWeather)
                        DailyWeatherView(dailyWeather: upcomingWeather.dailyWeather)
                    }
                    
                    DataAttributionView()
                        .padding(.leading)
                }
            }
            .padding()
        }
        .background(Color.weatherBackground)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: .init())
            .backgroundView()
    }
}
