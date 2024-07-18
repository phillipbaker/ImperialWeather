//
//  NetworkError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum NetworkError: Error, WeatherError {
    case invalidUrl
    case networkError
    case invalidResponse
    case invalidData

    var message: ErrorMessage {
        switch self {
        case .invalidUrl:
            return InvalidURLMessage()
        case .networkError:
            return NetworkErrorMessage()
        case .invalidResponse:
            return InvalidResponseMessage()
        case .invalidData:
            return InvalidDataMessage()
        }
    }
}
