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
                        .frame(width: 100, alignment: .leading)
                    Spacer()
                    
                    Image(systemName: daily.description[0].conditionName)
                        .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Text(primaryScale == .celsius
                            ? daily.temperature.maxCelsiusString
                            : daily.temperature.maxFahrenheitString)
                    Text(primaryScale == .celsius
                            ? daily.temperature.minCelsiusString
                            : daily.temperature.minFahrenheitString)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(dataModel: WeatherDataModel())
    }
}
