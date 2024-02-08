//
//  CurrentWeather.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 06/02/2024.
//

import Foundation
@testable import ImperialWeather

let conditionsRaw = ConditionsRaw(temp: 21.0)

let currentWeatherRaw = CurrentWeatherRaw(
    name: "London",
    main: conditionsRaw,
    weather: [weatherDescriptionRawDrizzle, weatherDescriptionRawInvalidId, weatherDescriptionRawThunderstorm]
)

let currentWeatherRawNoLocation = CurrentWeatherRaw(
    name: nil,
    main: conditionsRaw,
    weather: [weatherDescriptionRawThunderstorm, weatherDescriptionRawDrizzle]
)
                              
let currentWeatherPlain = CurrentWeatherPlain(
    icon: WeatherSymbol.drizzle,
    location: "London",
    description: WeatherDescription.drizzle,
    temperature: 21.0
)

let currentWeatherPlainNoLocation = CurrentWeatherPlain(
    icon: WeatherSymbol.thunderstorm,
    location: WeatherLabel.unknownLocation,
    description: WeatherDescription.thunderstorm,
    temperature: 21.0
)
