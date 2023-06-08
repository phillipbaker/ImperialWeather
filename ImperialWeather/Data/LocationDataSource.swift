//
//  LocationDataSource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/29/23.
//

import CoreLocation
import Foundation

class LocationDataSource {
    func location(latitude: String, longitude: String) async throws -> String {
        guard let latitude = CLLocationDegrees(latitude), let longitude = CLLocationDegrees(longitude) else {
            throw GeocodingError.coordinateError
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        return try await CLGeocoder().reverseGeocodeLocation(location).first?.locality ?? WeatherLabel.unknownLocation
    }
}
