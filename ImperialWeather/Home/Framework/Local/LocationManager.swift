//
//  LocationManager.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import CoreLocation
import Foundation

@MainActor final class LocationManager: NSObject, ObservableObject {
    @Published private(set) var error: Error?
    @Published private(set) var latitude: String?
    @Published private(set) var longitude: String?
    @Published private(set) var authorizationStatus: CLAuthorizationStatus
    
    private let locationManager: CLLocationManager
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        self.authorizationStatus = locationManager.authorizationStatus

        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.requestAuthorization()
        self.startUpdatingLocation()
    }
    
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
        
        if authorizationStatus == .notDetermined {
            self.requestAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            self.latitude = String(location.coordinate.latitude)
            self.longitude = String(location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }
}
