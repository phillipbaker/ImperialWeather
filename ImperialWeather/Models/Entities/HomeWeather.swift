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
    
    static func mapHomeWeatherFromData(data: HomeWeatherPlain) -> HomeWeather {
        return HomeWeather(
            current: CurrentWeather.mapCurrentWeatherFromData(data: data.current),
            hourly: HourlyWeather.mapHourlyWeatherFromData(data: data.hourly),
            daily: DailyWeather.mapDailyWeatherFromData(data: data.daily)
        )
    }
}
