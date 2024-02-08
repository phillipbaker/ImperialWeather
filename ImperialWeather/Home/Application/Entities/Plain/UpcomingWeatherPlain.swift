//
//  UpcomingWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

struct UpcomingWeatherPlain: Equatable {
    let hourly: [HourlyWeatherPlain]
    let daily: [DailyWeatherPlain]
}
