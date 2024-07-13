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
        let locationGateway = LocationLocalDataGateway(
            service: MockLocationService(
                mockEvent: .didUpdateLocation
            )
        )
        #expect(try await locationGateway.fetchLocation() == LocationPlain.mock)
    }
}
