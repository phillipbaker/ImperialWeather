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

    let (locationUpdates, continuation) = AsyncStream.makeStream(of: LocationUpdate.self)

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
            throw GeocodingError.geocodingError
        }

        return name
    }
}

extension LocationServiceImpl: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            requestWhenInUseAuthorization()
        case .restricted, .denied:
            continuation.yield(.didFailWithError(.permissionError))
            stopUpdatingLocation()
        case .authorizedAlways, .authorizedWhenInUse:
            startUpdatingLocation()
        @unknown default:
            continuation.yield(.didFailWithError(.permissionError))
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            continuation.yield(.didUpdateLocation(location))
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation.yield(.didFailWithError(.locationError))
    }
}
