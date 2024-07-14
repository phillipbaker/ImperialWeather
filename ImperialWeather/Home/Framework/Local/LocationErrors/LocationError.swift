//
//  LocationError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/6/23.
//

import Foundation

enum LocationError: Error, WeatherError {
    case coordinateError
    case geocodingError
    case permissionError
    case locationError
    
    var message: ErrorMessage {
        switch self {
        case .coordinateError, .geocodingError, .locationError:
            return LocationErrorMessage()
        case .permissionError:
            return LocationPermissionMessage()
        }
    }
}
