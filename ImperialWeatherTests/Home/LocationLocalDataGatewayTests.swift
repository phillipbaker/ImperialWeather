//
//  LocationLocalDataGatewayTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

struct LocationLocalDataGatewayTests {
    @Test func fetchLocation() async throws {
        let locationGateway = LocationLocalDataGateway(service: MockLocationService())
        #expect(try await locationGateway.fetchLocation() == (latitude: "0.0", longitude: "0.0"))
    }
    
    @Test func locationName() async throws {
        let locationGateway = LocationLocalDataGateway(service: MockLocationService())
        #expect(try await locationGateway.locationName(for: "0.0", and: "0.0") == "London")
    }
}
