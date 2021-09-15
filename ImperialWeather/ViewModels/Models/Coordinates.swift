//
//  Coordinates.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

import Foundation

struct Coordinates: Codable {
    var longitude: Double
    var latitude: Double
}

extension Coordinates {
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
