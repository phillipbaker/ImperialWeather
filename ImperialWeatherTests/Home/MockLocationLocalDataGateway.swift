//
//  MockLocationLocalDataGateway.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

final class MockLocationLocalDataGateway: LocationDataSourceLocal {
    func fetchLocation() async throws -> LocationPlain {
        return LocationPlain.mock
    }
}
