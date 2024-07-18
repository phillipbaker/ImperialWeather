//
//  CurrentWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct CurrentWeatherRaw: Decodable, Equatable {
    let name: String?
    let main: ConditionsRaw
    let weather: [WeatherDescriptionRaw]

    func mapToPlain() -> CurrentWeatherPlain {
        return CurrentWeatherPlain(
            icon: WeatherDescriptionRaw.mapFirstIcon(from: weather),
            location: name ?? WeatherLabel.unknownLocation,
            description: WeatherDescriptionRaw.mapFirstDescription(from: weather),
            temperature: main.temp
        )
    }
}
