//
//  LocationLocalDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

final class LocationLocalDataGateway: LocationDataSourceLocal {
    let service: LocationService
    
    init(service: LocationService) {
        self.service = service
    }
    
    func fetchLocation() async throws -> (latitude: String, longitude: String) {
        return try await service.fetchLocation()
    }
    
    func locationName(for latitude: String, and longitude: String) async throws -> String {
        return try await service.fetchPlaceName(for: latitude, and: longitude)
    }
}
