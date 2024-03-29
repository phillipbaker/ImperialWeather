//
//  HourlyWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

struct HourlyWeatherPlain: Equatable {
    let hour: Date
    let icon: String
    let temperature: Double
}
