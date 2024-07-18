//
//  APIClientTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/07/2024.
//

import Foundation
@testable import ImperialWeather
import Testing

struct APIClientTests {
    @Test func validResponse() async throws {
        let session = URLSession.mockURLProtocolSession()
        let apiClient = APIClient(urlSession: session)
        let url = try #require(CurrentWeatherResource.validResourceMock().url)

        #expect(try await apiClient.data(from: url) == .validCurrentWeatherDataMock())
    }

    @Test func invalidResponse() async throws {
        let session = URLSession.mockURLProtocolSession()
        let apiClient = APIClient(urlSession: session)
        let url = try #require(UpcomingWeatherResource.validResourceMock().url)

        await #expect(throws: NetworkError.invalidResponse) {
            try await apiClient.data(from: url)
        }
    }
}
