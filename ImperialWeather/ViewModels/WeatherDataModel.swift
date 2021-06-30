//
//  WeatherDataModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import CoreLocation
import Foundation

enum LoadingState {
    case idle
    case loading
    case failed(WeatherError)
    case loaded
}

final class WeatherDataModel: ObservableObject {
    @Published private(set) var currentWeather: CurrentWeather
    @Published private(set) var upcomingWeather: UpcomingWeather
    @Published private(set) var loadingState: LoadingState = .idle

    private var locationManager: LocationManager
    private var currentWeatherRequest: APIRequest<CurrentWeatherResource>?
    private var upcomingWeatherRequest: APIRequest<UpcomingWeatherResource>?

    init() {
        locationManager = LocationManager()
        currentWeather = TestData.currentWeather // make this fetch last saved forecast from AppStorage/CoreData?
        upcomingWeather = TestData.upcomingWeather  // make this fetch last saved forecast from AppStorage/CoreData?
        locationManager.delegate = self
    }
    
    func fetchWeather(location: CLLocationCoordinate2D) {
        loadingState = .loading
        let group = DispatchGroup()
        group.enter()
        fetchCurrentWeather(location: location)
        group.leave()
        group.enter()
        fetchUpcomingWeather(location: location)
        group.leave()
        group.notify(queue: .main) {
        }
        self.loadingState = .loaded
    }
    
    func fetchCurrentWeather(location: CLLocationCoordinate2D) {
        let resource = CurrentWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let request = APIRequest(resource: resource)
        self.currentWeatherRequest = request
        request.execute { [weak self] currentWeather in
            self?.currentWeather = currentWeather ?? TestData.currentWeather // make this an error state
        }
    }
    
    func fetchUpcomingWeather(location: CLLocationCoordinate2D) {
        let resource = UpcomingWeatherResource(latitude: String(location.latitude), longitude: String(location.longitude))
        let request = APIRequest(resource: resource)
        self.upcomingWeatherRequest = request
        request.execute { [weak self] upcomingWeather in
            self?.upcomingWeather = upcomingWeather ?? TestData.upcomingWeather // make this an error state
        }
    }
}

extension WeatherDataModel: LocationManagerDelegate {
    func locationManager(_ locationManager: LocationManager, didUpdate location: CLLocationCoordinate2D) {
        fetchWeather(location: location)
    }
    
    func locationManager(_ locationManager: LocationManager, didUpdate status: CLAuthorizationStatus) {
        // update the status heres
    }
    
    func locationManager(_ locationManger: LocationManager, didFailWith error: WeatherError?) {
        guard let error = error else { return }
        loadingState = .failed(error) // and the error is the device failed to return location data
    }
}
