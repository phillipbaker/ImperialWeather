//
//  HourlyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct HourlyWeatherRaw: Decodable, Equatable {
    let dt: Date
    let temp: Double
    let weather: [WeatherDescriptionRaw]
    
    func mapToPlain() -> HourlyWeatherPlain {
        return HourlyWeatherPlain(
            hour: dt,
            icon: WeatherDescriptionRaw.mapFirstIcon(from: weather),
            temperature: temp
        )
    }
    
    static func mapHourlyWeatherRawToPlain(hourlyWeatherRaw: [HourlyWeatherRaw]) -> [HourlyWeatherPlain] {
        return hourlyWeatherRaw.map { hourlyWeather in
            hourlyWeather.mapToPlain()
        }
    }
}
