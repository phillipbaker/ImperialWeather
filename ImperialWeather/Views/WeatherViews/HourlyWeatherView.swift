//
//  HourlyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
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
                            Text(primaryScale == .celsius
                                    ? "\(hourly.celsiusString)ºC"
                                    : "\(hourly.fahrenheitString)ºF")
                                .fontWeight(.medium)
                                
                                .accessibility(
                                    label: primaryScale == .celsius
                                        ? Text("\(hourly.celsiusString)º Celsius")
                                        : Text("\(hourly.fahrenheitString)º Fahrenheit")
                                )
                            
                            Text(primaryScale == .fahrenheit
                                    ? "\(hourly.celsiusString)ºC"
                                    : "\(hourly.fahrenheitString)ºF")
                                .foregroundColor(.secondary)
                                .accessibility(label: primaryScale == .fahrenheit
                                                ? Text("\(hourly.celsiusString)º Celsius")
                                                : Text("\(hourly.fahrenheitString)º Fahrenheit"))
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
