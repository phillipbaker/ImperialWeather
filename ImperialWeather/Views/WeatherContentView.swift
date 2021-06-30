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
        VStack {
            CurrentWeatherView(dataModel: dataModel)
            HourlyWeatherView(dataModel: dataModel)
            DailyWeatherView(dataModel: dataModel)
            PrimaryScalePickerView()
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView(dataModel: WeatherDataModel())
    }
}
