//
//  LocationServiceImpl.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 26/06/2024.
//

import CoreLocation
import Foundation

final class LocationServiceImpl: NSObject, @unchecked Sendable, LocationService {
    private let geocoder: CLGeocoder
    private let locationManager: CLLocationManager
    
    let (locationEvents, continuation) = AsyncStream.makeStream(of: LocationEvent.self)
    
    init(
        geocoder: CLGeocoder = CLGeocoder(),
        locationManager: CLLocationManager = CLLocationManager()
    ) {
        self.geocoder = geocoder
        self.locationManager = locationManager

        super.init()
        locationManager.delegate = self
    }
    
    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    private func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationName(for location: CLLocation) async throws -> String {
        guard let name = try await self.geocoder.reverseGeocodeLocation(location).first?.locality else {
            throw LocationError.geocodingError
        }

        return name
    }
}
    
extension LocationServiceImpl: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        continuation.yield(.didChangeAuthorization(manager.authorizationStatus))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            continuation.yield(.didUpdateLocations(location))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation.yield(.didFailWithError(error))
    }
}
