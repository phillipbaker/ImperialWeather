//
//  CurrentWeatherResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct CurrentWeatherResource: APIResource {
    typealias ModelType = CurrentWeatherRaw

    var latitude: String
    var longitude: String
    var queryItems: [(String, String?)]?

    var path: String { "/data/2.5/weather" }
}
