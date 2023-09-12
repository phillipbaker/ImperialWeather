//
//  ErrorDescription.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/22/23.
//

import Foundation

enum ErrorDescription {
    static let locationPermission = NSLocalizedString(
        "Imperial Weather needs your location to show you the weather where you are.",
        tableName: "ErrorMessage",
        comment: "Error message description when the app needs location access to provide a weather forecast."
    )
    
    static let locationError = NSLocalizedString(
        "Imperial Weather was unable to establish your location.",
        tableName: "ErrorMessage",
        comment: "Error message description when the app was not able to establish the user’s location."
    )
    
    static let invalidURL = NSLocalizedString(
        "Imperial Weather could not access weather at this URL.",
        tableName: "ErrorMessage",
        comment: "Error message description when the weather data request failed because an invalid URL was constructed."
    )
    
    static let networkError = NSLocalizedString(
        "The weather can’t be displayed because your device is currently offline.",
        tableName: "ErrorMessage",
        comment: "Error message description when the user is not connected to the Internet."
    )
    
    static let invalidResponse = NSLocalizedString(
        "Imperial Weather could not retrieve a forecast from the weather provider.",
        tableName: "ErrorMessage",
        comment: "Error message description when the weather service could not create forecast data."
    )
    
    static let invalidData = NSLocalizedString(
        "Imperial Weather could not create a forecast from the data provided.",
        tableName: "ErrorMessage",
        comment: "Error message description when forecast data was received in an invalid format and cannot be displayed."
    )
}
