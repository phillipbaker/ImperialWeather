//
//  DailyWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

fileprivate let now = Date.now
fileprivate let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: now)!
fileprivate let inTwoDays = Calendar.current.date(byAdding: .day, value: 2, to: now)!

let dailyWeatherRawToday = DailyWeatherRaw(
    dt: now,
    temp: TemperatureRaw(max: 22.0),
    weather: [weatherDescriptionRawThunderstorm, weatherDescriptionRawDrizzle, weatherDescriptionRawFog]
)

let dailyWeatherRawTomorrow = DailyWeatherRaw(
    dt: tomorrow,
    temp: TemperatureRaw(max: 24.0),
    weather: [weatherDescriptionRawDrizzle, weatherDescriptionRawThunderstorm, weatherDescriptionRawHaze]
)

let dailyWeatherRawInTwoDays = DailyWeatherRaw(
    dt: inTwoDays,
    temp: TemperatureRaw(max: 39.0),
    weather: [weatherDescriptionRawInvalidId, weatherDescriptionRawThunderstorm, weatherDescriptionRawDrizzle]
)

let dailyWeatherPlainToday = DailyWeatherPlain(
    day: now,
    icon: WeatherSymbol.thunderstorm,
    temperature: 22.0
)

let dailyWeatherPlainTomorrow = DailyWeatherPlain(
    day: tomorrow,
    icon: WeatherSymbol.drizzle,
    temperature: 24.0
)

let dailyWeatherPlainInTwoDays = DailyWeatherPlain(
    day: inTwoDays,
    icon: WeatherSymbol.placeholder,
    temperature: 39.0
)
