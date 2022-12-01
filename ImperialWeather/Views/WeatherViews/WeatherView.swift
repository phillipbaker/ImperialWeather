//
//  WeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct WeatherView: View {
    let weather: HomeWeather
    
    var body: some View {
        ScrollView(.vertical) {
            HorizontalSizeClassStack(verticalAlignment: .top, spacing: 16) {
                
                CurrentWeatherView(weather: weather.current)
                
                VStack(spacing: 16) {
                    HourlyWeatherView(hourlyWeather: weather.hourly)
                    
                    DailyWeatherView(dailyWeather: weather.daily)
                    
                    DataAttributionView()
                        .padding(.leading)
                }
            }
            .padding()
        }
        .background(Color.weatherBackground)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: HomeWeather.preview)
            .backgroundView()
    }
}
