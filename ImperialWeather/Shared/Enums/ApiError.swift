//
//  ApiError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum ApiError: Error {
    case locationError
    case networkError
    case invalidResponse
    case invalidData
    case decodingError
}
