//
//  ErrorButtonTitle.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/22/23.
//

import Foundation

enum ErrorButtonTitle {
    static let locationPermission = NSLocalizedString(
        "Check Location Permissions in Settings",
        tableName: "ErrorMessage",
        comment: "Button title directing the user to grant permission for location access in the system Settings app."
    )

    static let locationServices = NSLocalizedString(
        "Turn On Location Services in Settings",
        tableName: "ErrorMessage",
        comment: "Button title directing the user to enable location services in the system Settings app."
    )

    static let networkError = NSLocalizedString(
        "Check network connection in Settings",
        tableName: "ErrorMessage",
        comment: "Button title directing user to check their network connection in the system Settings app."
    )

    static let reportProblem = NSLocalizedString(
        "Report this Problem",
        tableName: "ErrorMessage",
        comment: "Button title directing the user to report their problem to the app developer."
    )
}
