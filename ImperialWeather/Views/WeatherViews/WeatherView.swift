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
            SizeClassStackView(verticalAlignment: .top, spacing: 16) {
                CurrentWeatherView(weather: viewModel.currentWeather ?? PreviewData.current)
                
                VStack(spacing: 16) {
                    HourlyWeatherView(hourlyWeather: viewModel.upcomingWeather?.hourlyWeather ?? PreviewData.hourly)
                    DailyWeatherView(dailyWeather: viewModel.upcomingWeather?.dailyWeather ?? PreviewData.daily)
                    DataAttributionView()
                }
            }
            .padding()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: .init())
            .backgroundView()
    }
}
