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
        VStack(spacing: 32) {
            VerticalSizeClassStack(spacing: 32) {
                VStack(spacing: 4) {
                    Text(weather.location)
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                    Text(weather.description)
                }
                .opacity(0.9)
                
                HStack(spacing: 16) {
                    WeatherImage(systemName: weather.icon)
                        .font(.system(size: 48))
                    
                    Divider()
                        .frame(maxHeight: 100)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        PrimaryTemperatureView(temperature: weather.temperature)
                            .font(.largeTitle)
                            .opacity(0.9)
                        
                        SecondaryTemperatureView(temperature: weather.temperature)
                    }
                }
            }
            
            TemperatureScalePicker()
        }
        .padding(.top)
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weather: CurrentWeather.preview)
            .padding()
            .backgroundView()
    }
}
