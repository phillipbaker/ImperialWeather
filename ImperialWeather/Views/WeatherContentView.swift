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
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                CurrentWeatherView(dataModel: dataModel)
                    .padding(.bottom)
                HourlyWeatherView(dataModel: dataModel)
                DailyWeatherView(dataModel: dataModel)
                Spacer()
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

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView(dataModel: WeatherDataModel())
    }
}
