//
//  LocationLocalDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import CoreLocation
import Foundation

class LocationLocalDataGateway: LocationDataSourceLocal {    
    func locationName(fromLatitude latitude: String, andLongitude longitude: String) async throws -> String {
        guard let latitude = CLLocationDegrees(latitude), let longitude = CLLocationDegrees(longitude) else {
            throw GeocodingError.coordinateError
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        guard let locationName = try await CLGeocoder().reverseGeocodeLocation(location).first?.locality else {
            throw GeocodingError.geocodingError
        }
        
        return locationName
    }
}
