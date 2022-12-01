//
//  WeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private(set) var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            HorizontalSizeClassStack(verticalAlignment: .top, spacing: 16) {
                
                CurrentWeatherView(weather: viewModel.weather.current)
                
                VStack(spacing: 16) {
                    HourlyWeatherView(hourlyWeather: viewModel.weather.hourly)
                    
                    DailyWeatherView(dailyWeather: viewModel.weather.daily)
                    
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
