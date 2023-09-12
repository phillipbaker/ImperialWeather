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
        super.init()
        
        Task { try await getWeather() }
    }
    
    private func getWeather() async throws {
        do {
            state = .success(try await getWeatherUseCase.weather(forLatitude: self.latitude, andLongitude: self.longitude))
        } catch NetworkingError.invalidUrl {
            state = .error(.invalidUrl)
        } catch NetworkingError.networkError {
            state = .error(.networkError)
        } catch NetworkingError.invalidResponse {
            state = .error(.invalidResponse)
        } catch NetworkingError.invalidData {
            state = .error(.invalidData)
        } catch {
            state = .error(.invalidData)
            print("Unexpected error: \(error)")
        }
    }
}
