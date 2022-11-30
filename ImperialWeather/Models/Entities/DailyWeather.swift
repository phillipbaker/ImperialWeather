//
//  DailyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct DailyWeather: Identifiable, Equatable {
    let id: UUID
    let day: Date
    let icon: String
    let temperature: Double
}

extension DailyWeather {
    static func mapDailyWeatherFromData(data: [DailyWeatherPlain]) -> [DailyWeather] {
        return data.map { dailyWeatherPlain in
            mapDailyWeather(plain: dailyWeatherPlain)
        }
    }

    private static func mapDailyWeather(plain: DailyWeatherPlain) -> DailyWeather {
        return DailyWeather(
            id: UUID(),
            day: plain.day,
            icon: plain.icon,
            temperature: plain.temperature
        )
    }
}
