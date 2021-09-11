//
//  UpcomingWeatherResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeatherResource: APIResource {
    typealias ModelType = UpcomingWeather

    var latitude: String
    var longitude: String

    var methodPath: String {
        return Path.oneCall.rawValue
    }
}
