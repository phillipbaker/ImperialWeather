//
//  HomeWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import Foundation

extension HomeWeather {
    static let preview = HomeWeather(
        current: CurrentWeather.preview,
        hourly: HourlyWeather.preview,
        daily: DailyWeather.preview
    )
}
