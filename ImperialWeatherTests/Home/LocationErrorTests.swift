//
//  LocationErrorTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 05/07/2024.
//

@testable import ImperialWeather
import Testing

struct LocationErrorTests {
    @Test func coordinateError() {
        let error = LocationError.coordinateError
        #expect(error.message is LocationErrorMessage)
    }
    
    @Test func geocodingError() {
        let error = LocationError.geocodingError
        #expect(error.message is LocationErrorMessage)
    }
    
    @Test func permissionError() {
        let error = LocationError.permissionError
        #expect(error.message is LocationPermissionMessage)
    }
}
