//
//  UpcomingWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeatherRaw: Codable {
    let hourlyWeather: [HourlyWeatherRaw]
    var dailyWeather: [DailyWeatherRaw]
    
    mutating func removeCurrentDayFromDailyWeather() -> UpcomingWeatherRaw {
        self.dailyWeather.remove(at: 0)
        return self
    }
}

extension UpcomingWeatherRaw {
    enum CodingKeys: String, CodingKey {
        case hourlyWeather = "hourly"
        case dailyWeather = "daily"
    }
}
