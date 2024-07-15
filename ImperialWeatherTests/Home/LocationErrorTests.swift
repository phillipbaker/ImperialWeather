//
//  LocationErrorTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

@testable import ImperialWeather
import Testing

struct LocationErrorTests {
    @Test func locationError() {
        let error = LocationError.locationError
        #expect(error.message is LocationErrorMessage)
    }
    
    @Test func geocodingError() {
        let error = GeocodingError.geocodingError
        #expect(error.message is LocationErrorMessage)
    }
    
    @Test func permissionError() {
        let error = LocationError.permissionError
        #expect(error.message is LocationPermissionMessage)
    }
}
