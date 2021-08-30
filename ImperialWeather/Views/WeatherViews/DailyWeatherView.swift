//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.upcomingWeather.dailyWeather) { daily in
                HStack {
                    Text(daily.formattedDay)
                        .frame(minWidth: 92, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: daily.description[0].conditionName)
                        .renderingMode(.original)
                        .imageScale(.large)
                        .paneShadow()
                    
                    Spacer()
                    
                    Text(temperatureScale == .celsius
                            ? "\(daily.temperature.max.celsiusString)ºC"
                            : "\(daily.temperature.max.fahrenheitString)ºF")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.trailing)
                        .frame(minWidth: 40)
                        .accessibility(label: temperatureScale == .celsius
                                        ? Text("\(daily.temperature.max.celsiusString)º Celsius")
                                        : Text("\(daily.temperature.max.fahrenheitString)º Fahrenheit"))
                    
                    
                    Text(temperatureScale == .fahrenheit
                            ? "\(daily.temperature.max.celsiusString)ºC"
                            : "\(daily.temperature.max.fahrenheitString)ºF")
                        .frame(minWidth: 40)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                        
                        .accessibility(
                            label: temperatureScale == .fahrenheit
                                ? Text("\(daily.temperature.max.celsiusString)º Celsius")
                                : Text("\(daily.temperature.max.fahrenheitString)º Fahrenheit")
                        )
                }
                .frame(minHeight: 28, alignment: .center)
            }
        }
        .paneBackground()
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(viewModel: WeatherViewModel())
    }
}
