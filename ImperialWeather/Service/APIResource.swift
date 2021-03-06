//
//  APIResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

enum Path: String {
    case currentWeather = "/data/2.5/weather"
    case upcomingWeather = "/data/3.0/onecall"
}

protocol APIResource {
    associatedtype ModelType: Decodable

    var methodPath: String { get }
    var latitude: String { get }
    var longitude: String { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.openweathermap.org")!
        components.path = methodPath
        components.queryItems = [
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "INSERT_APIKEY_HERE"),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]

        if methodPath == Path.upcomingWeather.rawValue {
            let currentDate = Date().timeIntervalSince1970
            let dateQueryItem = URLQueryItem(name: "dt", value: String(format: "%.0f", currentDate))
            components.queryItems?.append(dateQueryItem)
        }
        return components.url!
    }
}
