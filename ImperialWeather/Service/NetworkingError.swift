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
    case networkError
    case invalidResponse
    case invalidData

    var message: ErrorMessage {
        switch self {
        case .locationPermission:
            return LocationPermissionMessage()
        case .locationError:
            return LocationErrorMessage()
        case .networkError:
            return NetworkErrorMessage()
        case .invalidResponse:
            return InvalidResponseMessage()
        case .invalidData:
            return InvalidDataMessage()
        }
    }
}
