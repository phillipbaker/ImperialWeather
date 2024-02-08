//
//  HomeWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

let homeWeatherRaw = HomeWeatherRaw(
    currentWeather: currentWeatherRaw,
    hourlyWeather: [hourlyWeatherRawCurrentHour, hourlyWeatherNextHour, hourlyWeatherInTwoHours],
    dailyWeather: [dailyWeatherRawToday, dailyWeatherRawTomorrow, dailyWeatherRawInTwoDays]
)

let homeWeatherPlain = HomeWeatherPlain(
    current: currentWeatherPlain,
    hourly: [hourlyWeatherPlainCurrentHour, hourlyWeatherPlainNextHour, hourlyWeatherPlainInTwoHours],
    daily: [dailyWeatherPlainTomorrow, dailyWeatherPlainInTwoDays]
)
