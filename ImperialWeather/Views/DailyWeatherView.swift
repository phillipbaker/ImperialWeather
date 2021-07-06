//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject private(set) var dataModel: WeatherDataModel
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(dataModel.upcomingWeather.dailyWeather) { daily in
                HStack {
                    Text(daily.formattedDay)
                        .frame(minWidth: 92, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: daily.description[0].conditionName)
                        .renderingMode(.original)
                        .imageScale(.large)
                        .paneShadow()
                    
                    Spacer()
                    
                    Text(primaryScale == .celsius
                            ? "\(daily.temperature.maxCelsiusString)ºC"
                            : "\(daily.temperature.maxFahrenheitString)ºF")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.trailing)
                        .frame(minWidth: 40)
                        .font(.callout)
                    
                    Text(primaryScale == .fahrenheit
                            ? "\(daily.temperature.maxCelsiusString)ºC"
                            : "\(daily.temperature.maxFahrenheitString)ºF")
                        .frame(minWidth: 40)
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                .frame(minHeight: 28, alignment: .center)
            }
        }
        .paneBackground()
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(dataModel: WeatherDataModel())
    }
}
