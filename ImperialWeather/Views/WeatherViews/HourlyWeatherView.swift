//
//  HourlyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.upcomingWeather.hourlyWeather) { hourly in
                    VStack(spacing: 16) {
                        Text(hourly.formattedHour)
                            .font(.callout)
                        Image(systemName: hourly.description[0].conditionName)
                            .renderingMode(.original)
                            .frame(minWidth: 28, minHeight: 28, alignment: .top)
                            .imageScale(.large)
                            .paneShadow()
                        
                        VStack(spacing: 8) {
                            Text(temperatureScale == .celsius
                                    ? "\(hourly.temperature.celsiusString)ºC"
                                    : "\(hourly.temperature.fahrenheitString)ºF")
                                .fontWeight(.medium)
                                
                                .accessibility(
                                    label: temperatureScale == .celsius
                                        ? Text("\(hourly.temperature.celsiusString)º Celsius")
                                        : Text("\(hourly.temperature.fahrenheitString)º Fahrenheit")
                                )
                            
                            Text(temperatureScale == .fahrenheit
                                    ? "\(hourly.temperature.celsiusString)ºC"
                                    : "\(hourly.temperature.fahrenheitString)ºF")
                                .foregroundColor(.secondary)
                                .accessibility(label: temperatureScale == .fahrenheit
                                                ? Text("\(hourly.temperature.celsiusString)º Celsius")
                                                : Text("\(hourly.temperature.fahrenheitString)º Fahrenheit"))
                        }
                    }
                }
            }
        }
        .paneBackground()
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: WeatherViewModel())
    }
}
