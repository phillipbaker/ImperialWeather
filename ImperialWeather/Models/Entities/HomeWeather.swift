//
//  HomeWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

struct HomeWeather {
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}
