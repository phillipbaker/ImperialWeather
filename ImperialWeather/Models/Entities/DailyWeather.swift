//
//  DailyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct DailyWeather: Identifiable {
    let id: UUID
    let day: Date
    let icon: String
    let temperature: Double
    
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

    private static func mapFahrenheit(from temperature: Double) -> Double {
        return ((temperature * 1.8) + 32)
    }
    
    private func wide() -> String {
        return day.formatted(.dateTime.weekday(.wide))
    }
    
    private func narrow() -> String {
        return day.formatted(.dateTime.weekday(.narrow))
    }
}
