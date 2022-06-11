//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    var weather: CurrentWeather
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 4) {
                Text(weather.location ?? "Unknown")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(weather.description.first?.description ?? "Unknown")
            }
            
            WeatherImageView(imageName: weather.description.first?.conditionName ?? WeatherIcon.dashedSquare)
                .font(.system(size: 48))
                .padding(.vertical)
            
            VStack(spacing: 8) {
                PrimaryTemperatureView(temperature: weather.conditions.temperature)
                    .font(.largeTitle)
                
                SecondaryTemperatureView(temperature: weather.conditions.temperature)
                    .font(.title2)
            }
            .padding(.vertical)
            
            TemperatureScalePickerView()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weather: PreviewData.current)
            .padding()
            .backgroundView()
    }
}
