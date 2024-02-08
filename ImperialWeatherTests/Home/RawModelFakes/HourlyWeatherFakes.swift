//
//  HourlyWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

fileprivate let now = Date.now
fileprivate let nextHour = Calendar.current.date(byAdding: .hour, value: 1, to: now)!
fileprivate let inTwoHours = Calendar.current.date(byAdding: .hour, value: 2, to: now)!

let hourlyWeatherRawCurrentHour = HourlyWeatherRaw(
    dt: now,
    temp: 27.0,
    weather: [
        weatherDescriptionRawThunderstorm,
        weatherDescriptionRawDrizzle,
        weatherDescriptionRawInvalidId
    ]
)

let hourlyWeatherNextHour = HourlyWeatherRaw(
    dt: nextHour,
    temp: 29.0,
    weather: [
        weatherDescriptionRawDrizzle,
        weatherDescriptionRawThunderstorm,
        weatherDescriptionRawInvalidId
    ]
)

let hourlyWeatherInTwoHours = HourlyWeatherRaw(
    dt: inTwoHours,
    temp: 20.0,
    weather: [
        weatherDescriptionRawInvalidId,
        weatherDescriptionRawThunderstorm,
        weatherDescriptionRawDrizzle
    ]
)

let hourlyWeatherPlainCurrentHour = HourlyWeatherPlain(
    hour: now,
    icon: WeatherSymbol.thunderstorm,
    temperature: 27.0
)

let hourlyWeatherPlainNextHour = HourlyWeatherPlain(
    hour: nextHour,
    icon: WeatherSymbol.drizzle,
    temperature: 29.0
)

let hourlyWeatherPlainInTwoHours = HourlyWeatherPlain(
    hour: inTwoHours,
    icon: WeatherSymbol.placeholder,
    temperature: 20.0
)
