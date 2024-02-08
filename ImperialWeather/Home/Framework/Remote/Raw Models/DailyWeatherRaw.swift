//
//  DailyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct DailyWeatherRaw: Decodable, Equatable {
    let dt: Date
    let temp: TemperatureRaw
    let weather: [WeatherDescriptionRaw]
    
    func mapToPlain() -> DailyWeatherPlain {
        return DailyWeatherPlain(
            day: dt,
            icon: WeatherDescriptionRaw.mapFirstIcon(from: weather),
            temperature: temp.max
        )
    }
    
    static func mapDailyWeatherRawToPlain(dailyWeatherRaw: [DailyWeatherRaw]) -> [DailyWeatherPlain] {
        return dailyWeatherRaw
            .filter { !Calendar.current.isDateInToday($0.dt) }
            .map { $0.mapToPlain() }
    }
}
