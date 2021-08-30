//
//  WeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.weatherBackground)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    CurrentWeatherView(viewModel: viewModel)
                    HourlyWeatherView(viewModel: viewModel)
                    DailyWeatherView(viewModel: viewModel)
                    
                    HStack {
                        Text("Source: OpenWeatherMap.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        Spacer()
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 72)
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        TemperatureScalePickerView()
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchLocation()
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel())
    }
}
