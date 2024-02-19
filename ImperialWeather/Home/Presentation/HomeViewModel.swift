//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

@MainActor final class HomeViewModel: ObservableObject {

    let latitude: String
    let longitude: String
    let getWeatherUseCase = GetWeather(
        source: GetWeatherSourceImpl(
            locationDataSourceLocal: LocationLocalDataGateway(),
            weatherDataSourceRemote: WeatherRemoteDataGateway(service: WeatherServiceImpl())
        )
    )
    
    @Published private(set) var state: HomeState = .loading
    
    @MainActor init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
        
        Task { await getWeather() }
    }
    
    private func getWeather() async {
        do {
            state = .success(try await getWeatherUseCase.weather(forLatitude: self.latitude, andLongitude: self.longitude))
        } catch NetworkError.invalidUrl {
            state = .error(.invalidUrl)
        } catch NetworkError.networkError {
            state = .error(.networkError)
        } catch NetworkError.invalidResponse {
            state = .error(.invalidResponse)
        } catch NetworkError.invalidData {
            state = .error(.invalidData)
        } catch {
            state = .error(.invalidData)
            print("Unexpected error: \(error)")
        }
    }
}
