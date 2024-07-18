//
//  APIResourceTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 02/07/2024.
//

@testable import ImperialWeather
import Testing

struct APIResourceTests {
    @Test func validCurrentWeatherResourceURL() throws {
        let resource = CurrentWeatherResource.validResourceMock()
        #expect(resource.scheme == "https")
        #expect(resource.host == "api.openweathermap.org")
        #expect(resource.path == "/data/2.5/weather")

        let url = try #require(resource.url)
        #expect(url.absoluteString == .validCurrentWeatherURLStringMock())
    }

    @Test func validResourceWithQueryItems() throws {
        let resource = CurrentWeatherResource.validResourceWithQueryItems()
        let url = try #require(resource.url)
        #expect(url.absoluteString == .validCurrentWeatherURLStringMockWithQueryItems())
    }

    @Test func validUpcomingWeatherResourceURL() throws {
        let resource = UpcomingWeatherResource.validResourceMock()
        #expect(resource.scheme == "https")
        #expect(resource.host == "api.openweathermap.org")
        #expect(resource.path == "/data/3.0/onecall")

        let url = try #require(resource.url)
        #expect(url.absoluteString == .upcomingWeatherURLStringMock())
    }
}
