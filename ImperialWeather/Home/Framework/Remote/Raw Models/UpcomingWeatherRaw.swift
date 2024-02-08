//
//  UpcomingWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeatherRaw: Decodable, Equatable {
    let hourly: [HourlyWeatherRaw]
    let daily: [DailyWeatherRaw]
}
