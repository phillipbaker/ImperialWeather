//
//  WeatherRootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct WeatherRootView: View {
    @StateObject private var dataModel = WeatherDataModel()
    @StateObject private var locationManager = LocationManager()
    @AppStorage("primaryScale") private var primaryScale: PrimaryScale = .celsius
    
    var body: some View {
        VStack(spacing: 48) {
            Text(dataModel.forecast.location ?? "Unknown")
                .font(.system(size: 48))
                .fontWeight(.bold)
            
            Image(systemName: dataModel.forecast.description[0].conditionName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 128)
                .cornerRadius(8)
            
            VStack(spacing: 4) {
                Text("It’s currently ").font(.largeTitle).fontWeight(.bold) +
                    Text(primaryScale == .celsius
                            ? "\(dataModel.forecast.conditions.celsiusString)ºC"
                            : "\(dataModel.forecast.conditions.fahrenheitString)ºF")
                    .font(.largeTitle).fontWeight(.bold)
                
                Text("That’s ").font(.title).foregroundColor(.secondary) +
                    Text(primaryScale == .fahrenheit
                            ? "\(dataModel.forecast.conditions.celsiusString)ºC "
                            : "\(dataModel.forecast.conditions.fahrenheitString)ºF ")
                    .font(.title).foregroundColor(.secondary) +
                    Text("to you").font(.title).foregroundColor(.secondary)
            }
            
            PrimaryScalePickerView()
        }
        .padding()
        
        .onAppear {
            locationManager.requestLocation()
            dataModel.fetchCurrentWeather(location: locationManager.location)
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
