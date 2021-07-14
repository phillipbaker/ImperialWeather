//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
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
                Text(primaryScale == .celsius
                        ? "\(viewModel.currentWeather.conditions.celsiusString)ºC"
                        : "\(viewModel.currentWeather.conditions.fahrenheitString)ºF")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(primaryScale == .fahrenheit
                        ? "\(viewModel.currentWeather.conditions.celsiusString)ºC "
                        : "\(viewModel.currentWeather.conditions.fahrenheitString)ºF ")
                    .font(.title2)
                    .foregroundColor(.secondary)
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
        CurrentWeatherView(viewModel: WeatherViewModel())
    }
}
