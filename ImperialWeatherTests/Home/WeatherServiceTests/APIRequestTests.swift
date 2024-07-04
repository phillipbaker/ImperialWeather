//
//  APIRequestTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 02/07/2024.
//

import Foundation
@testable import ImperialWeather
import Testing

final class APIRequestTests {
    @Test func validCurrentWeatherRequest() throws {
        let currentWeatherRequest = APIRequest(resource: CurrentWeatherResource.validResourceMock())
        let decodedData = try currentWeatherRequest.decode(.validCurrentWeatherDataMock())
        #expect(decodedData == CurrentWeatherRaw.validDataMock())
    }
    
    @Test func invalidCurrentWeatherRequest() {
        let currentWeatherRequest = APIRequest(resource: CurrentWeatherResource.validResourceMock())
        #expect(throws: NetworkError.invalidData) {
            try currentWeatherRequest.decode(.invalidDataMock())
        }
    }
    
    @Test func validUpcomingWeatherRequest() throws {
        let upcomingWeatherRequest = APIRequest(resource: UpcomingWeatherResource.validResourceMock())
        let decodedData = try upcomingWeatherRequest.decode(.validUpcomingWeatherDataMock())
        #expect(decodedData == UpcomingWeatherRaw.validDataMock())
    }
    
    @Test func invalidUpcomingWeatherRequest() {
        let upcomingWeatherRequest = APIRequest(resource: UpcomingWeatherResource.validResourceMock())
        #expect(throws: NetworkError.invalidData) {
            try upcomingWeatherRequest.decode(.invalidDataMock())
        }
    }
}
