//
//  HomeWeatherRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/26/23.
//

import Foundation

struct HomeWeatherRaw: Equatable {
    let currentWeather: CurrentWeatherRaw
    let hourlyWeather: [HourlyWeatherRaw]
    let dailyWeather: [DailyWeatherRaw]

    func mapToPlain() -> HomeWeatherPlain {
        HomeWeatherPlain(
            current: currentWeather.mapToPlain(),
            hourly: HourlyWeatherRaw.mapHourlyWeatherRawToPlain(hourlyWeatherRaw: hourlyWeather),
            daily: DailyWeatherRaw.mapDailyWeatherRawToPlain(dailyWeatherRaw: dailyWeather)
        )
    }
}
