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
        VStack(spacing: 16) {
            VStack(spacing: 4) {
                Text(dataModel.currentWeather.location ?? "Unknown")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(dataModel.currentWeather.description[0].description)
            }
            
            Image(systemName: dataModel.currentWeather.description[0].conditionName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
            
            VStack(spacing: 8) {
                Text(primaryScale == .celsius
                        ? "\(dataModel.currentWeather.conditions.celsiusString)ºC"
                        : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF")
                    .font(.largeTitle).fontWeight(.bold)
                
                Text("(That’s ").font(.title2).foregroundColor(.secondary) +
                    Text(primaryScale == .fahrenheit
                            ? "\(dataModel.currentWeather.conditions.celsiusString)ºC "
                            : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF ")
                    .font(.title2).foregroundColor(.secondary) +
                    Text("to you.)").font(.title2).foregroundColor(.secondary)
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(dataModel: WeatherDataModel())
    }
}
