//
//  HomeWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
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
