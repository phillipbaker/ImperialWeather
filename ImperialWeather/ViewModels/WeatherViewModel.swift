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
    
    private var currentWeatherRequest: APIRequest<CurrentWeatherResource>?
    private var upcomingWeatherRequest: APIRequest<UpcomingWeatherResource>?
    
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
        guard loadingState != .loading else { return }
        loadingState = .loading
        
        let currentWeatherResource = CurrentWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let currentRequest = APIRequest(resource: currentWeatherResource)
        self.currentWeatherRequest = currentRequest

        let upcomingWeatherResource = UpcomingWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let upcomingRequest = APIRequest(resource: upcomingWeatherResource)
        self.upcomingWeatherRequest = upcomingRequest
        
        do {
            currentWeather = try await currentRequest.execute()
            var upcoming = try await upcomingRequest.execute()
            upcomingWeather = upcoming?.removeCurrentDayFromDailyWeather()
            loadingState = .loaded
        } catch {
            switch error {
            case NetworkingError.locationError:
                loadingState = .failed(.locationError)
            case NetworkingError.invalidResponse:
                loadingState = .failed(.invalidResponse)
            case NetworkingError.invalidData:
                loadingState = .failed(.invalidData)
            case NetworkingError.networkError:
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
