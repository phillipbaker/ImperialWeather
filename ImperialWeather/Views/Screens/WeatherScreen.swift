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
        switch viewModel.loadingState {
        case .none, .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded:
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
        case .failed(let error):
            ErrorScreen(error: error)
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            WeatherScreen(viewModel: WeatherViewModel())
        }
    }
}
