//
//  WeatherServiceMocks.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 02/07/2024.
//

import Foundation
@testable import ImperialWeather

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
        "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=5378ee83a13bdf24c6d0fe970cd52038&lat=0.0&lon=0.0"
    }
    
    static func validCurrentWeatherURLStringMockWithQueryItems() -> String {
        "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=5378ee83a13bdf24c6d0fe970cd52038&lat=0.0&lon=0.0&anotherkey=anotherValue"
    }
    
    static func currentDateMock() -> String {
        let currentDate = Date().timeIntervalSince1970
        return String(format: "%.0f", currentDate)
    }
    
    static func upcomingWeatherURLStringMock() -> String {
        "https://api.openweathermap.org/data/3.0/onecall?units=metric&appid=5378ee83a13bdf24c6d0fe970cd52038&lat=0.0&lon=0.0&dt=\(String.currentDateMock())&exclude=currently,%20minutely,%20alerts"
    }
}
