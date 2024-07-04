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
    
    var message: ErrorMessage {
        switch self {
        case .coordinateError, .geocodingError:
            return LocationErrorMessage()
        case .permissionError:
            return LocationPermissionMessage()
        }
    }
}
