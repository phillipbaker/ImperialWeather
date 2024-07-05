//
//  HomeWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

@testable import ImperialWeather

extension HomeWeatherRaw {
    static let mock = HomeWeatherRaw(
        currentWeather: .mock,
        hourlyWeather: .mock,
        dailyWeather: .mock
    )
}

extension HomeWeatherPlain {
    static let mock = HomeWeatherPlain(
        current: .mock,
        hourly: .mock,
        daily: .mock
    )
}

extension HomeWeatherLocationPlain {
    static let mock = HomeWeatherLocationPlain(
        location: "London",
        weather: .mock
    )
}

extension HomeWeather {
    static let mock = HomeWeather(
        current: .mock,
        hourly: .mock,
        daily: .mock
    )
}
