//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

@MainActor
final class WeatherViewModel: NSObject, ObservableObject {
    @Published var loadingState: LoadingState
    @Published private(set) var currentWeather: CurrentWeather
    @Published private(set) var upcomingWeather: UpcomingWeather
    
    private let service: WeatherService
    
    @MainActor
    init(service: WeatherService) {
        loadingState = .idle
        currentWeather = PlaceholderForecast.currentWeather
        upcomingWeather = PlaceholderForecast.upcomingWeather
        self.service = service
        super.init()
    }
    
    func fetchWeather(for location: CLLocationCoordinate2D) async {
        loadingState = .loading
        do {
            currentWeather = try await service.fetchCurrentWeather(for: location)
            upcomingWeather = try await service.fetchUpcomingWeather(for: location)
            loadingState = .loaded
        } catch {
            switch error {
            case ApiError.badLocation:
                loadingState = .failed(.badLocation)
            case ApiError.decodingError:
                loadingState = .failed(.decodingError)
            case ApiError.invalidResponse:
                loadingState = .failed(.invalidResponse)
            case ApiError.invalidData:
                loadingState = .failed(.invalidData)
            case ApiError.networkError:
                loadingState = .failed(.networkError)
            default:
                loadingState = .failed(.invalidData)
            }
        }
    }
}
