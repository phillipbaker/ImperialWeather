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
    // MARK: - Properties
    
    @Published private(set) var error: Error?
    @Published private(set) var loadingState: LoadingState?
    @Published private(set) var currentWeather: CurrentWeather?
    @Published private(set) var upcomingWeather: UpcomingWeather?
    @Published private(set) var authorizationStatus: CLAuthorizationStatus
    
    private let service = WeatherService()
    private let locationManager = CLLocationManager()
    
    // MARK: - Methods
    
    @MainActor
    override init() {
        authorizationStatus = locationManager.authorizationStatus

        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchWeather(for location: CLLocationCoordinate2D) async {
        loadingState = .loading
        do {
            currentWeather = try await service.fetchCurrentWeather(for: location)
            upcomingWeather = try await service.fetchUpcomingWeather(for: location)
            loadingState = .loaded
        } catch {
            switch error {
            case APIError.locationError:
                loadingState = .failed(.locationError)
            case APIError.invalidResponse:
                loadingState = .failed(.invalidResponse)
            case APIError.invalidData:
                loadingState = .failed(.invalidData)
            case APIError.networkError:
                loadingState = .failed(.networkError)
            default:
                loadingState = .failed(.invalidData)
            }
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    // MARK: - CLLocationManager Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            locationManager.stopUpdatingLocation()
            Task { await fetchWeather(for: location) }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .notDetermined {
            requestPermission()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }
}
