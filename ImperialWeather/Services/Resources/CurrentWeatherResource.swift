//
//  CurrentWeatherResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct CurrentWeatherResource: ApiResource {
    typealias ModelType = CurrentWeather

    var latitude: String
    var longitude: String

    var methodPath: String {
        return Path.currentWeather.rawValue
    }
}
