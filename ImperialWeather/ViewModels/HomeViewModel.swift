//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

@MainActor final class HomeViewModel: NSObject, ObservableObject {

    let latitude: String
    let longitude: String
    var getWeatherUseCase = GetWeather()
    
    @Published private(set) var state: HomeState = .loading
    
    @MainActor init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
        super.init()
        
        Task { try await getWeather(lat: self.latitude, lon: self.longitude) }
    }
    
    private func getWeather(lat: String, lon: String) async throws {
        do {
            state = HomeState.success(try await getWeatherUseCase.weather(lat: lat, lon: lon))
        } catch {
            state = HomeState.error(.invalidData)
        }
    }
}
