//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject private(set) var dataModel: WeatherDataModel
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 12) {
                VStack(spacing: 4) {
                    Text(dataModel.currentWeather.location ?? "Unknown")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(dataModel.currentWeather.description[0].description)
                }
                
                Image(systemName: dataModel.currentWeather.description[0].conditionName)
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 72))
                    .padding(.vertical)
                    .paneShadow()
            }
            
            VStack(spacing: 8) {
                Text(primaryScale == .celsius
                        ? "\(dataModel.currentWeather.conditions.celsiusString)ºC"
                        : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(primaryScale == .fahrenheit
                        ? "\(dataModel.currentWeather.conditions.celsiusString)ºC "
                        : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF ")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .paneBackground()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(dataModel: WeatherDataModel())
    }
}
