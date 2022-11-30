//
//  HomeWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

struct HomeWeatherPlain {
    let current: CurrentWeatherPlain
    let hourly: [HourlyWeatherPlain]
    let daily: [DailyWeatherPlain]
}
