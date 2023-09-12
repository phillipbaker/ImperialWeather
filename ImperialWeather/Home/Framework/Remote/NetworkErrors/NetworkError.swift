//
//  NetworkingError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum NetworkingError: Error {
    
    case locationPermission
    case locationError
    case invalidUrl
    case networkError
    case invalidResponse
    case invalidData

    var message: ErrorMessage {
        switch self {
        case .locationPermission:
            return LocationPermissionMessage()
        case .locationError:
            return LocationErrorMessage()
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
