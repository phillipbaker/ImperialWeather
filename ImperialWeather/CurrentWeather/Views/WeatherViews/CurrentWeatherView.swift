//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 12) {
                VStack(spacing: 4) {
                    Text(viewModel.currentWeather.location ?? "Unknown")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(viewModel.currentWeather.description[0].description)
                }
                
                Image(systemName: viewModel.currentWeather.description[0].conditionName)
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 72))
                    .padding(.vertical)
                    .paneShadow()
            }
            
            VStack(spacing: 8) {
                Text(temperatureScale == .celsius
                    ? "\(viewModel.currentWeather.conditions.temperature.celsiusString)ºC"
                    : "\(viewModel.currentWeather.conditions.temperature.fahrenheitString)ºF")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .accessibility(label: Text(temperatureScale == .celsius
                            ? "\(viewModel.currentWeather.conditions.temperature.celsiusString)º Celsius"
                            : "\(viewModel.currentWeather.conditions.temperature.fahrenheitString)º Fahrenheit")
                    )
                
                Text(temperatureScale == .fahrenheit
                    ? "\(viewModel.currentWeather.conditions.temperature.celsiusString)ºC"
                    : "\(viewModel.currentWeather.conditions.temperature.fahrenheitString)ºF")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .accessibility(label: Text(temperatureScale == .fahrenheit
                            ? "\(viewModel.currentWeather.conditions.temperature.celsiusString)º Celsius"
                            : "\(viewModel.currentWeather.conditions.temperature.celsiusString)º Fahrenheit")
                    )
            }
            .redacted(reason: viewModel.loadingState == .loading ? .placeholder : [])
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
            
            CurrentWeatherView(viewModel: WeatherViewModel())
                .padding(.horizontal)
        }
    }
}
