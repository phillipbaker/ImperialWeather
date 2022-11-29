//
//  UpcomingWeatherResource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeatherResource: APIResource {
    typealias ModelType = UpcomingWeatherRaw
    
    var path: String { "/data/3.0/onecall" }
    
    var latitude: String
    var longitude: String
    
    var queryItems: [(String, String?)]? {
        // Current date query item
        let currentDate = Date().timeIntervalSince1970
        return [
            ("dt", String(format: "%.0f", currentDate)),
            ("exclude", "currently, minutely, alerts")
        ]
    }
}
