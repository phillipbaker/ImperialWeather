//
//  WeatherDescriptionRawFakes.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Foundation

let weatherDescriptionRawInvalidId = WeatherDescriptionRaw(icon: "04n", id: 100)
let weatherDescriptionRawThunderstorm = WeatherDescriptionRaw(icon: "04d", id: 200)
let weatherDescriptionRawDrizzle = WeatherDescriptionRaw(icon: "10n", id: 300)
let weatherDescriptionRawRain = WeatherDescriptionRaw(icon: "04n", id: 301)
let weatherDescriptionRawIce = WeatherDescriptionRaw(icon: "10d", id: 511)
let weatherDescriptionRawSnow = WeatherDescriptionRaw(icon: "04d", id: 600)
let weatherDescriptionRawFog = WeatherDescriptionRaw(icon: "10n", id: 701)
let weatherDescriptionRawHaze = WeatherDescriptionRaw(icon: "08d", id: 721)
let weatherDescriptionRawTornado = WeatherDescriptionRaw(icon: "11n", id: 781)
let weatherDescriptionRawClearDay = WeatherDescriptionRaw(icon: "10d", id: 800)
let weatherDescriptionRawClearNight = WeatherDescriptionRaw(icon: "05n", id: 800)
