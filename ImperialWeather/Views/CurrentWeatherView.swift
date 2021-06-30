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
        VStack(spacing: 48) {
            VStack() {
                Text(dataModel.currentWeather.location ?? "Unknown")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                
                Image(systemName: dataModel.currentWeather.description[0].conditionName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 128, height: 128)
                    .cornerRadius(8)
                
                VStack(spacing: 4) {
                    Text("It’s currently ").font(.largeTitle).fontWeight(.bold) +
                        Text(primaryScale == .celsius
                                ? "\(dataModel.currentWeather.conditions.celsiusString)ºC"
                                : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF")
                        .font(.largeTitle).fontWeight(.bold)
                    
                    Text("That’s ").font(.title).foregroundColor(.secondary) +
                        Text(primaryScale == .fahrenheit
                                ? "\(dataModel.currentWeather.conditions.celsiusString)ºC "
                                : "\(dataModel.currentWeather.conditions.fahrenheitString)ºF ")
                        .font(.title).foregroundColor(.secondary) +
                        Text("to you").font(.title).foregroundColor(.secondary)
                }
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(dataModel: WeatherDataModel())
    }
}
