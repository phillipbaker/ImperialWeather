//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 32) {
            Group {
                VStack(spacing: 4) {
                    Text(viewModel.currentWeather.location ?? "Unknown")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(viewModel.currentWeather.description.first?.description ?? "Unknown")
                }
                
                WeatherImageView(name: viewModel.currentWeather.description.first?.conditionName ?? WeatherIcon.dashedSquare)
                    .font(.system(size: 72))
                    .padding(.vertical)
                
                VStack(spacing: 8) {
                    PrimaryTemperatureView(temperature: viewModel.currentWeather.conditions.temperature)
                        .font(.largeTitle)
                    
                    SecondaryTemperatureView(temperature: viewModel.currentWeather.conditions.temperature)
                        .font(.title2)
                }
            }
            
            TemperatureScalePickerView()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.weatherBackground
                .edgesIgnoringSafeArea(.all)
            
            CurrentWeatherView(viewModel: WeatherViewModel(service: WeatherService()))
                .padding(.horizontal)
        }
    }
}
