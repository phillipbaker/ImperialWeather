//
//  UpcomingWeatherView.swift
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
            HStack(spacing: 24) {
                ForEach(dataModel.upcomingWeather.hourlyWeather) { hourly in
                    VStack(spacing: 8) {
                        Text(hourly.formattedHour)
                            .font(.callout.uppercaseSmallCaps())
                        Image(systemName: hourly.description[0].conditionName)
                            .frame(width: 32, height: 32, alignment: .center)
                            .imageScale(.large)
                        Text(primaryScale == .celsius ? hourly.celsiusString : hourly.fahrenheitString) + Text("º")
                            .font(.callout)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(dataModel: WeatherDataModel())
    }
}
