//
//  MockLocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

import CoreLocation
@testable import ImperialWeather

struct MockLocationService: LocationService {
    let mockEvent: LocationUpdate
    let authorizationStatus: CLAuthorizationStatus
    
    var locationUpdates: AsyncStream<LocationUpdate> {
        AsyncStream { continuation in
            continuation.yield(mockEvent)
        }
    }
    
    init(
        mockEvent: LocationUpdate,
        authorizationStatus: CLAuthorizationStatus = .authorizedWhenInUse
    ) {
        self.mockEvent = mockEvent
        self.authorizationStatus = authorizationStatus
    }
    
    func locationName(for location: CLLocation) async throws -> String {
        return "London"
    }
}
