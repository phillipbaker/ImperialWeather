//
//  WeatherContentView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct WeatherContentView: View {
    @ObservedObject private(set) var dataModel: WeatherDataModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.weatherBackground)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    CurrentWeatherView(dataModel: dataModel)
                    HourlyWeatherView(dataModel: dataModel)
                    DailyWeatherView(dataModel: dataModel)
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        PrimaryScalePickerView()
                    }
                }
                .padding()
            }
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView(dataModel: WeatherDataModel())
    }
}
