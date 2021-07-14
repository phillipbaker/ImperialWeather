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
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        PrimaryScalePickerView()
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
