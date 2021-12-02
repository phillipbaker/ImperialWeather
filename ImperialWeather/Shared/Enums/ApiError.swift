//
//  ApiError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum ApiError: Error {
    case badLocation
    case networkError
    case invalidResponse
    case invalidData
}
