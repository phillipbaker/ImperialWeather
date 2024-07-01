//
//  WeatherSymbol.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/11/21.
//

import Foundation

enum WeatherSymbol: String, CaseIterable {
    case clearDay = "sun.max.fill"
    case clearNight = "moon.stars.fill"
    case cloud = "cloud.fill"
    case drizzle = "cloud.drizzle.fill"
    case dust = "sun.dust.fill"
    case fog = "cloud.fog.fill"
    case haze = "sun.haze.fill"
    case heavyRain = "cloud.heavyrain.fill"
    case ice = "snowflake"
    case invalidId = "square.dashed"
    case rain = "cloud.rain.fill"
    case sleet = "cloud.sleet.fill"
    case smoke = "smoke.fill"
    case snow = "cloud.snow.fill"
    case thunderstorm = "cloud.bolt.rain.fill"
    case tornado = "tornado"
}
