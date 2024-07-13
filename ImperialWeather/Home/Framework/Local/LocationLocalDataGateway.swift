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
        for await event in service.locationEvents {
            switch event {
            case let .didChangeAuthorization(status):
                switch status {
                case .notDetermined:
                    service.requestWhenInUseAuthorization()
                case .restricted, .denied:
                    throw LocationError.permissionError
                case .authorizedAlways, .authorizedWhenInUse:
                    service.startUpdatingLocation()
                @unknown default:
                    throw LocationError.permissionError
                }
            case let .didUpdateLocations(location):
                return LocationPlain(
                    name: try await service.locationName(for: location),
                    latitude: location.coordinate.latitude.description,
                    longitude: location.coordinate.longitude.description
                )
            case .didFailWithError:
                throw LocationError.coordinateError
            }
        }
        throw LocationError.coordinateError
    }
}
