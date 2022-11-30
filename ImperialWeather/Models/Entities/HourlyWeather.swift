//
//  HourlyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct HourlyWeather: Identifiable {
    let id: UUID
    let hour: Date
    let icon: String
    let temperature: Double
    
    static func mapHourlyWeatherFromData(data: [HourlyWeatherPlain]) -> [HourlyWeather] {
        return data.map { hourlyWeatherPlain in
            mapHourlyWeather(plain: hourlyWeatherPlain)
        }
    }
    
    private static func mapHourlyWeather(plain: HourlyWeatherPlain) -> HourlyWeather {
        return HourlyWeather(
            id: UUID(),
            hour: plain.hour,
            icon: plain.icon,
            temperature: plain.temperature
        )
    }
    
    private func hourFormat() -> String {
        return hour <= Date.now ? "Now" : hour.formatted(.dateTime.hour())
    }
}
