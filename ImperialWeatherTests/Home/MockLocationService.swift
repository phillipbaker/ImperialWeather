//
//  MockLocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

import CoreLocation
@testable import ImperialWeather

final class MockLocationService: LocationService {
    let mockEvent: LocationEvent
    
    init(mockEvent: LocationEvent) {
        self.mockEvent = mockEvent
    }
    
    func locationName(for location: CLLocation) async throws -> String {
        return "London"
    }
    
    var locationEvents: AsyncStream<LocationEvent> {
        AsyncStream { continuation in
            continuation.yield(mockEvent)
        }
    }
    
    func startUpdatingLocation() {}
    func requestWhenInUseAuthorization() {}
}
