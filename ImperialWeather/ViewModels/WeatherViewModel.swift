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
    @Published private(set) var error: Error?
    @Published private(set) var weather: HomeWeather?
    @Published private(set) var loadingState: LoadingState?
    @Published private(set) var authorizationStatus: CLAuthorizationStatus
    
    private let locationManager = CLLocationManager()
    
    var getWeatherUseCase = GetWeather()
    
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
    
    private func getWeather(lat: String, lon: String) async throws {
        guard loadingState != .loading else { return }
        loadingState = .loading
        
        do {
            weather = try await getWeatherUseCase.weather(lat: lat, lon: lon)
            loadingState = .loaded
        } catch {
            loadingState = .failed(.invalidData)
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            locationManager.stopUpdatingLocation()
            Task { try await getWeather(lat: String(location.latitude), lon: String(location.longitude)) }
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
