//
//  LocationError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/6/23.
//

import Foundation

enum LocationError: Error, WeatherError {
    case permissionError
    case locationError

    var message: ErrorMessage {
        switch self {
        case .locationError:
            return LocationErrorMessage()
        case .permissionError:
            return LocationPermissionMessage()
        }
    }
}

enum GeocodingError: Error, WeatherError {
    case geocodingError

    var message: ErrorMessage {
        return LocationErrorMessage()
    }
}
