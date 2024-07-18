//
//  WeatherServiceMocks.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 02/07/2024.
//

import Foundation
@testable import ImperialWeather

extension URLSession {
    static func mockURLProtocolSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
}

final class MockAPIClientSuccess: APIClientProtocol {
    func data(from: URL) async throws -> Data {
        return try Data.validCurrentWeatherDataMock()
    }
}

extension CurrentWeatherResource {
    static func validResourceMock() -> CurrentWeatherResource {
        CurrentWeatherResource(latitude: "0.0", longitude: "0.0")
    }

    static func validResourceWithQueryItems() -> CurrentWeatherResource {
        CurrentWeatherResource(latitude: "0.0", longitude: "0.0", queryItems: [("anotherkey", "anotherValue")])
    }
}

extension UpcomingWeatherResource {
    static func validResourceMock() -> UpcomingWeatherResource {
        UpcomingWeatherResource(latitude: "0.0", longitude: "0.0")
    }
}

extension String {
    static func validCurrentWeatherURLStringMock() -> String {
        """
        https://api.openweathermap.org/data/2.5/weather\
        ?units=metric\
        &appid=5378ee83a13bdf24c6d0fe970cd52038\
        &lat=0.0\
        &lon=0.0
        """
    }

    static func validCurrentWeatherURLStringMockWithQueryItems() -> String {
        """
        https://api.openweathermap.org/data/2.5/weather\
        ?units=metric\
        &appid=5378ee83a13bdf24c6d0fe970cd52038\
        &lat=0.0\
        &lon=0.0\
        &anotherkey=anotherValue
        """
    }

    static func currentDateMock() -> String {
        let currentDate = Date().timeIntervalSince1970
        return String(format: "%.0f", currentDate)
    }

    static func upcomingWeatherURLStringMock() -> String {
        """
        https://api.openweathermap.org/data/3.0/onecall\
        ?units=metric\
        &appid=5378ee83a13bdf24c6d0fe970cd52038\
        &lat=0.0\
        &lon=0.0\
        &dt=\(String.currentDateMock())\
        &exclude=currently,%20minutely,%20alerts
        """
    }
}

extension Data {
    static func readJson(from resource: String) throws -> Data {
        let bundle = Bundle(for: APIRequestTests.self)
        guard let path = bundle.path(forResource: resource, ofType: "json") else {
            throw NetworkError.invalidData
        }
        return try Data(contentsOf: URL(fileURLWithPath: path))
    }

    static func validCurrentWeatherDataMock() throws -> Data {
        return try readJson(from: "validCurrentWeatherMock")
    }

    static func validUpcomingWeatherDataMock() throws -> Data {
        return try readJson(from: "validUpcomingWeatherMock")
    }

    static func invalidDataMock() -> Data {
        return Data("".utf8)
    }
}

extension CurrentWeatherRaw {
    static func validDataMock() -> CurrentWeatherRaw {
        CurrentWeatherRaw(
            name: Optional("Globe"),
            main: ConditionsRaw(temp: 24.45),
            weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]
        )
    }
}

extension UpcomingWeatherRaw {
    static func validDataMock() -> UpcomingWeatherRaw {
        UpcomingWeatherRaw(
            hourly: [
                HourlyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1719925200),
                    temp: 24.45,
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]
                ),
                HourlyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1719928800),
                    temp: 24.43,
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]
                ),
                HourlyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1719932400),
                    temp: 24.43,
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]
                )
            ],
            daily: [
                DailyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1719921600),
                    temp: TemperatureRaw(max: 24.95),
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]),
                DailyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1720008000),
                    temp: TemperatureRaw(max: 24.94),
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]),
                DailyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1720094400),
                    temp: TemperatureRaw(max: 25.1),
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]),
                DailyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1720180800),
                    temp: TemperatureRaw(max: 24.81),
                    weather: [WeatherDescriptionRaw(icon: "04d", id: 804)]),
                DailyWeatherRaw(
                    dt: Date(timeIntervalSince1970: 1720267200),
                    temp: TemperatureRaw(max: 24.16),
                    weather: [WeatherDescriptionRaw(icon: "10d", id: 500)])
            ]
        )
    }
}
