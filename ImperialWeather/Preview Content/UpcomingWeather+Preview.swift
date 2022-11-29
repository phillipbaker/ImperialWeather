//
//  UpcomingWeatherRaw+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension UpcomingWeatherRaw {
    static let preview: UpcomingWeatherRaw = .init(hourlyWeather: HourlyWeatherRaw.preview, dailyWeather: DailyWeatherRaw.preview)
}
