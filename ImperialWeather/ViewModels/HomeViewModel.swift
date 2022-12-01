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
    
    @Published private(set) var weather: HomeWeather
    @Published private(set) var state: HomeState = .loading
    
    @MainActor
    override init() {
        authorizationStatus = locationManager.authorizationStatus
        
        weather = HomeWeather(
            current: CurrentWeather(
                id: UUID(),
                icon: WeatherIcon.placeholder,
                location: "Unknown Location",
                description: "Unknown Weather",
                temperature: 0.0),
            hourly: [
                HourlyWeather(
                    id: UUID(),
                    hour: Date.now,
                    icon: WeatherIcon.placeholder,
                    temperature: 0.0
                )
            ],
            daily: [
                DailyWeather(
                    id: UUID(),
                    day: Date.now,
                    icon: WeatherIcon.placeholder,
                    temperature: 0.0
                )
            ]
        )
        
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
            weather = try await getWeatherUseCase.weather(lat: lat, lon: lon)
            state = HomeState.success(weather)
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
