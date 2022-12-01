//
//  LocationViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import CoreLocation
import Foundation

@MainActor final class LocationViewModel: NSObject, ObservableObject {
    @Published private(set) var error: Error?
    @Published private(set) var latitude: String = "0.0"
    @Published private(set) var longitude: String = "0.0"
    @Published private(set) var authorizationStatus: CLAuthorizationStatus
    
    private let manager = CLLocationManager()
    
    override init() {
        authorizationStatus = manager.authorizationStatus
                
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            manager.stopUpdatingLocation()
            self.latitude = String(location.latitude)
            self.longitude = String(location.longitude)
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
