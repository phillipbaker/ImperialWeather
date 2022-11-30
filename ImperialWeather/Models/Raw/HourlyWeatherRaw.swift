//
//  HourlyWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

struct HourlyWeatherRaw: Decodable, Identifiable {
    let id = UUID()
    let hour: Date
    let temperature: Double
    let description: [WeatherDescriptionRaw]
    
    func mapToPlain() -> HourlyWeatherPlain {
        return HourlyWeatherPlain(
            hour: hour,
            icon: WeatherDescriptionRaw.mapFirstIcon(from: description),
            temperature: temperature
        )
    }
    
    static func mapHourlyWeatherRawToPlain(hourlyWeatherRaw: [HourlyWeatherRaw]) -> [HourlyWeatherPlain] {
        return hourlyWeatherRaw.map { hourlyWeather in
            hourlyWeather.mapToPlain()
        }
    }
}

extension HourlyWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case hour = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}
