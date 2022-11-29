//
//  CoordinatesRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

import Foundation

struct CoordinatesRaw: Codable {
    var longitude: Double
    var latitude: Double
}

extension CoordinatesRaw {
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
