//
//  CurrentWeatherPlain.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/12/23.
//

import Foundation

struct CurrentWeatherPlain: Equatable {
    let icon: String
    let location: String
    let description: String
    let temperature: Double
}
