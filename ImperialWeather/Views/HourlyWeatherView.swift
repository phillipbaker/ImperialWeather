//
//  HourlyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject private(set) var dataModel: WeatherDataModel
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(dataModel.upcomingWeather.hourlyWeather) { hourly in
                    VStack(spacing: 16) {
                        Text(hourly.formattedHour)
                            .font(.body.uppercaseSmallCaps())
                        Image(systemName: hourly.description[0].conditionName)
                            .renderingMode(.original)
                            .frame(minWidth: 28, minHeight: 28, alignment: .top)
                            .imageScale(.large)
                            .paneShadow()
                        
                        VStack(spacing: 8) {
                            Text(primaryScale == .celsius
                                    ? "\(hourly.celsiusString)ºC"
                                    : "\(hourly.fahrenheitString)ºF")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text(primaryScale == .fahrenheit
                                    ? "\(hourly.celsiusString)ºC"
                                    : "\(hourly.fahrenheitString)ºF")
                                .font(.callout)
                                .foregroundColor(.secondary)
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
        HourlyWeatherView(dataModel: WeatherDataModel())
    }
}
