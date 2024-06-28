//
//  LocationServiceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 26/06/2024.
//

import CoreLocation
import Foundation

final class LocationServiceImpl: NSObject, CLLocationManagerDelegate, LocationService, @unchecked Sendable {
    private let geocoder: CLGeocoder
    private let locationManager: CLLocationManager
    private var authorizationStatus: CLAuthorizationStatus
    private var locationContinuation: CheckedContinuation<(latitude: String, longitude: String), Error>?
    
    override init() {
        self.geocoder = CLGeocoder()
        self.locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func fetchLocation() async throws -> (latitude: String, longitude: String) {
        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            throw LocationError.permissionError
        case .restricted, .denied:
            throw LocationError.permissionError
        case .authorizedAlways, .authorizedWhenInUse:
            return try await withCheckedThrowingContinuation { continuation in
                self.locationContinuation = continuation
                locationManager.requestLocation()
            }
        @unknown default:
            throw LocationError.permissionError
        }
    }
    
    func fetchPlaceName(for latitude: String, and longitude: String) async throws -> String {
        guard let latitude = CLLocationDegrees(latitude), let longitude = CLLocationDegrees(longitude) else {
            throw LocationError.coordinateError
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        guard let locationName = try await self.geocoder.reverseGeocodeLocation(location).first?.locality else {
            throw LocationError.geocodingError
        }
        
        return locationName
    }
    
    // MARK: - Location Delegate
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationContinuation?.resume(returning: (location.coordinate.latitude.description, location.coordinate.longitude.description))
            locationContinuation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
    }
}
