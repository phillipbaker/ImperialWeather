//
//  UpcomingWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeather: Codable {
    let hourlyWeather: [HourlyWeather]
    var dailyWeather: [DailyWeather]
    
    mutating func removeCurrentDayFromDailyWeather() -> UpcomingWeather {
        self.dailyWeather.remove(at: 0)
        return self
    }
}

extension UpcomingWeather {
    enum CodingKeys: String, CodingKey {
        case hourlyWeather = "hourly"
        case dailyWeather = "daily"
    }
}
