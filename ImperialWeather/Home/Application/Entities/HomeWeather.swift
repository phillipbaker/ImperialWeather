//
//  HomeWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import Foundation

struct HomeWeather: Equatable {
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]

    static func == (lhs: HomeWeather, rhs: HomeWeather) -> Bool {
        return lhs.current == rhs.current && lhs.hourly == rhs.hourly && lhs.daily == rhs.daily
    }

    static func mapHomeWeatherFromData(data: HomeWeatherLocationPlain) -> HomeWeather {
        return HomeWeather(
            current: CurrentWeather(
                icon: data.weather.current.icon,
                location: data.location,
                description: data.weather.current.description,
                celsius: Measurement(value: data.weather.current.temperature, unit: .celsius)
            ),
            hourly: HourlyWeather.mapHourlyWeatherFromData(data: data.weather.hourly),
            daily: DailyWeather.mapDailyWeatherFromData(data: data.weather.daily)
        )
    }
}
