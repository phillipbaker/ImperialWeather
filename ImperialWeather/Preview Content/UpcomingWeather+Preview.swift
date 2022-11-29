//
//  UpcomingWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension UpcomingWeather {
    static let preview: UpcomingWeather = .init(hourlyWeather: HourlyWeather.preview, dailyWeather: DailyWeather.preview)
}
