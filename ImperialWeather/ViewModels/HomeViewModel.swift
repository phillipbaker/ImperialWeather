//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

@MainActor
final class HomeViewModel: NSObject, ObservableObject {
    // Location
    @Published private(set) var error: Error?
    @Published private(set) var authorizationStatus: CLAuthorizationStatus
    
    private let locationManager = CLLocationManager()

    // Weather
    var getWeatherUseCase = GetWeather()
    
    @Published private(set) var state: HomeState = .loading
    
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
        do {
            state = HomeState.success(try await getWeatherUseCase.weather(lat: lat, lon: lon))
        } catch {
            state = HomeState.error(.invalidData)
        }
    }
}

extension HomeViewModel: CLLocationManagerDelegate {
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
