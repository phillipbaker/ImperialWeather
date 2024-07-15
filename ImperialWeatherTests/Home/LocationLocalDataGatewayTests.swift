//
//  LocationLocalDataGatewayTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct LocationLocalDataGatewayTests {
    @Test func didUpdateLocationWhenInUse() async throws {
        let mockLocationService = MockLocationService(mockEvent: .didUpdateLocation, authorizationStatus: .authorizedWhenInUse)
        let locationGateway = LocationLocalDataGateway(service: mockLocationService)
        #expect(try await locationGateway.fetchLocation() == LocationPlain.mock)
    }
    
    @Test func didUpdateLocationAlways() async throws {
        let mockLocationService = MockLocationService(mockEvent: .didUpdateLocation, authorizationStatus: .authorizedAlways)
        let locationGateway = LocationLocalDataGateway(service: mockLocationService)
        #expect(try await locationGateway.fetchLocation() == LocationPlain.mock)
    }
    
    @Test func didFailWithLocationError() async throws {
        let mockLocationService = MockLocationService(mockEvent: .didFailWithLocationError)
        let locationGateway = LocationLocalDataGateway(service: mockLocationService)
        await #expect(throws: LocationError.locationError) {
            try await locationGateway.fetchLocation()
        }
    }
    
    @Test func didFailWithPermissionError() async throws {
        let mockLocationService = MockLocationService(mockEvent: .didFailWithPermissionError)
        let locationGateway = LocationLocalDataGateway(service: mockLocationService)
        await #expect(throws: LocationError.permissionError) {
            try await locationGateway.fetchLocation()
        }
    }
}
