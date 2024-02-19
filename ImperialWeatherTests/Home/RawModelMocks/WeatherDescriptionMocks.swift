//
//  WeatherDescriptionRawFakes.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Foundation

extension WeatherDescriptionRaw {
    static let mock_invalidID = WeatherDescriptionRaw(icon: "04n", id: 100)
    static let mock_thunderstorm = WeatherDescriptionRaw(icon: "04d", id: 200)
    static let mock_drizzle = WeatherDescriptionRaw(icon: "10n", id: 300)
    static let mock_rain = WeatherDescriptionRaw(icon: "04n", id: 301)
    static let mock_ice = WeatherDescriptionRaw(icon: "10d", id: 511)
    static let mock_snow = WeatherDescriptionRaw(icon: "04d", id: 600)
    static let mock_fog = WeatherDescriptionRaw(icon: "10n", id: 701)
    static let mock_haze = WeatherDescriptionRaw(icon: "08d", id: 721)
    static let mock_tornado = WeatherDescriptionRaw(icon: "11n", id: 781)
    static let mock_clearDay = WeatherDescriptionRaw(icon: "10d", id: 800)
    static let mock_clearNight = WeatherDescriptionRaw(icon: "05n", id: 800)
}
