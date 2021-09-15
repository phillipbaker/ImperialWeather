//
//  UpcomingWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeather: Codable {
    let hourlyWeather: [HourlyWeather]
    let dailyWeather: [DailyWeather]
}

extension UpcomingWeather {
    enum CodingKeys: String, CodingKey {
        case hourlyWeather = "hourly"
        case dailyWeather = "daily"
    }
}
