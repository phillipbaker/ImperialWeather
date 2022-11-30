//
//  DailyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct DailyWeatherRaw: Decodable, Identifiable {
    let id = UUID()
    let day: Date
    let temperature: TemperatureRaw
    let description: [WeatherDescriptionRaw]
    
    func mapToPlain() -> DailyWeatherPlain {
        return DailyWeatherPlain(
            day: day,
            icon: WeatherDescriptionRaw.mapFirstIcon(from: description),
            temperature: temperature.max
        )
    }
    
    static func mapDailyWeatherRawToPlain(dailyWeatherRaw: [DailyWeatherRaw]) -> [DailyWeatherPlain] {
        return dailyWeatherRaw.map { dailyWeather in
            dailyWeather.mapToPlain()
        }
    }
    
}

extension DailyWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case day = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}

extension DailyWeatherRaw: Equatable {
    static func == (lhs: DailyWeatherRaw, rhs: DailyWeatherRaw) -> Bool {
        lhs.id == rhs.id
    }
}
