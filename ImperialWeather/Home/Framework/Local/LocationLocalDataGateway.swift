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
    
    func fetchLocation() async throws -> LocationPlain {
        for await event in service.locationUpdates {
            switch event {
            case let .didUpdateLocation(location):
                return LocationPlain(
                    name: try await service.locationName(for: location),
                    latitude: location.coordinate.latitude.description,
                    longitude: location.coordinate.longitude.description
                )
            case let .didFailWithError(error):
                switch error {
                case .permissionError:
                    throw LocationError.permissionError
                case .locationError:
                    throw LocationError.locationError
                }
            }
        }
        throw LocationError.locationError
    }
}
