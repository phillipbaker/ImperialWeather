//
//  APIError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum APIError: Error {
    case locationError
    case networkError
    case invalidResponse
    case invalidData
    case locationPermission
}
