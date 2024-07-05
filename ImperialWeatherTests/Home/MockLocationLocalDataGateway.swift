//
//  MockLocationLocalDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

final class MockLocationLocalDataGateway: LocationDataSourceLocal {
    func fetchLocation() async throws -> (latitude: String, longitude: String) {
        return (latitude: "0.0", longitude: "0.0")
    }
    
    func locationName(for latitude: String, and longitude: String) async throws -> String {
        return "London"
    }
}
