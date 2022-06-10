//
//  APIError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/14/21.
//

import Foundation

enum APIError: Error {
    
    case locationPermission
    case locationError
    case networkError
    case invalidResponse
    case invalidData
    
    struct ErrorMessage {
        var image: String
        var title: String
        var description: String
        var buttonTitle: String
        var buttonAction: () -> Void
    }

    var message: ErrorMessage {
        switch self {
        case .locationPermission:
            return ErrorMessage(
                image: LocationPermission.image,
                title: LocationPermission.title,
                description: LocationPermission.description,
                buttonTitle: LocationPermission.buttonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        case .locationError:
            return ErrorMessage(
                image: LocationError.image,
                title: LocationError.title,
                description: LocationError.description,
                buttonTitle: LocationError.buttonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        case .networkError:
            return ErrorMessage(
                image: NetworkError.image,
                title: NetworkError.title,
                description: NetworkError.description,
                buttonTitle: NetworkError.buttonTitle,
                buttonAction: ButtonAction.launchAppSettings
            )
        case .invalidResponse:
            return ErrorMessage(
                image: InvalidResponse.image,
                title: InvalidResponse.title,
                description: InvalidResponse.description,
                buttonTitle: InvalidResponse.buttonTitle,
                buttonAction: ButtonAction.submitFeedback
            )
        case .invalidData:
            return ErrorMessage(
                image: InvalidData.image,
                title: InvalidData.title,
                description: InvalidData.description,
                buttonTitle: InvalidData.buttonTitle,
                buttonAction: ButtonAction.submitFeedback
            )
        }
    }
}
