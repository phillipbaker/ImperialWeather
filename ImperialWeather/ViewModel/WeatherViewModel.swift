//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

final class WeatherViewModel: NSObject, ObservableObject {
    @Published private(set) var loadingState: LoadingState
    @Published private(set) var currentWeather: CurrentWeather
    @Published private(set) var upcomingWeather: UpcomingWeather

    private var locationManager = CLLocationManager()
    private var currentWeatherRequest: APIRequest<CurrentWeatherResource>?
    private var upcomingWeatherRequest: APIRequest<UpcomingWeatherResource>?

    override init() {
        loadingState = .idle
        currentWeather = PlaceholderForecast.currentWeather
        upcomingWeather = PlaceholderForecast.upcomingWeather
        super.init()
        locationManager.delegate = self
        fetchWeather()
    }
    
    func fetchWeather() {
        loadingState = .loading
        fetchLocation()
    }
    
    func fetchLocation() {
        if locationManager.authorizationStatus == .denied {
            loadingState = .locationDenied
            return
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
    }
    
    func fetchWeather(location: CLLocationCoordinate2D) {
        let group = DispatchGroup()
        group.enter()
        fetchCurrentWeather(location: location)
        group.leave()
        group.enter()
        fetchUpcomingWeather(location: location)
        group.leave()
        group.notify(queue: .main) {}
    }
    
    func fetchCurrentWeather(location: CLLocationCoordinate2D) {
        let resource = CurrentWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let request = APIRequest(resource: resource)
        currentWeatherRequest = request
        request.execute { [weak self] result in
            switch result {
            case .success(let currentWeather):
                DispatchQueue.main.async {
                    self?.currentWeather = currentWeather ?? PlaceholderForecast.currentWeather
                    self?.loadingState = .loaded
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.loadingState = .failed(error)
                }
            }
        }
    }
    
    func fetchUpcomingWeather(location: CLLocationCoordinate2D) {
        let resource = UpcomingWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let request = APIRequest(resource: resource)
        upcomingWeatherRequest = request
        request.execute { [weak self] result in
            switch result {
            case .success(let upcomingWeather):
                DispatchQueue.main.async {
                    self?.upcomingWeather = upcomingWeather ?? PlaceholderForecast.upcomingWeather
                    self?.loadingState = .loaded
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.loadingState = .failed(error)
                }
            }
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied {
            loadingState = .locationDenied
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        manager.stopUpdatingLocation()
        fetchWeather(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(String(describing: error))
    }
}
