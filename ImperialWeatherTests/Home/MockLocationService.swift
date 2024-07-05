//
//  MockLocationService.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

@testable import ImperialWeather

final class MockLocationService: LocationService {
    func fetchLocation() async throws -> (latitude: String, longitude: String) {
        return (latitude: "0.0", longitude: "0.0")
    }
    
    func fetchPlaceName(for latitude: String, and longitude: String) async throws -> String {
        return "London"
    }
}
