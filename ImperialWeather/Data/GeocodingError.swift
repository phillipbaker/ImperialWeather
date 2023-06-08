//
//  GeocodingError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/6/23.
//

import Foundation

enum GeocodingError: Error {
    case coordinateError
    case geocodingError
    case locationError
}
