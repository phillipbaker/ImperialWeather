//
//  APIResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

enum Path: String {
    case oneCall = "/data/2.5/onecall"
    case currentWeather = "/data/2.5/weather"
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
            URLQueryItem(name: "appid", value: "71d1255fad977d3697df22bede5335e2"),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]
        
        if methodPath == Path.oneCall.rawValue {
            let currentDate = Date().timeIntervalSince1970
            let dateQueryItem = URLQueryItem(name: "dt", value: String(format: "%.0f", currentDate))
            components.queryItems?.append(dateQueryItem)
        }
        return components.url!
    }
}
