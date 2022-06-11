//
//  HourlyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    var hourlyWeather: [HourlyWeather]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(hourlyWeather) { hour in
                    HourlyWeatherRow(hour: hour)
                }
            }
        }
        .paneBackground()
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(hourlyWeather: PreviewData.hourly)
            .padding(.horizontal)
            .backgroundView()
    }
}
