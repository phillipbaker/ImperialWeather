//
//  WeatherScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct WeatherScreen: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            SizeClassStackView(verticalAlignment: .top, spacing: 16) {
                CurrentWeatherView(viewModel: viewModel)
                VStack(spacing: 16) {
                    HourlyWeatherView(viewModel: viewModel)
                    DailyWeatherView(viewModel: viewModel)
                    DataAttributionView()
                }
            }
            .padding()
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            WeatherScreen(viewModel: WeatherViewModel(service: WeatherService()))
        }
    }
}
