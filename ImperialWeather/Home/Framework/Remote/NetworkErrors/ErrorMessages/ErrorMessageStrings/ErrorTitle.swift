//
//  ErrorTitle.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/22/23.
//

import Foundation

enum ErrorTitle {
    static let locationPermission = NSLocalizedString(
        "Imperial Weather Cannot Access Your Location",
        tableName: "ErrorMessage",
        comment: "Error message title when the user has not given permission for the app to access their location."
    )
    
    static let locationError = NSLocalizedString(
        "Unable to Establish Your Location",
        tableName: "ErrorMessage",
        comment: "Error message title when the device was not able to calculate the user’s location for any reason."
    )
    
    static let invalidURL = NSLocalizedString(
        "Invalid URL",
        tableName: "ErrorMessage",
        comment: "Error message title when the app could not construct a valid URL to request weather data."
    )
    
    static let networkError = NSLocalizedString(
        "You Are Not Connected to the Internet",
        tableName: "ErrorMessage",
        comment: "Error message title when the user is not connected to the Internet."
    )
    
    static let invalidResponse = NSLocalizedString(
        "Invalid API Key",
        tableName: "ErrorMessage",
        comment: "Error message title when the weather service could not create forecast data."
    )
    
    static let invalidData = NSLocalizedString(
        "Invalid Data",
        tableName: "ErrorMessage",
        comment: "Error message title when forecast data was received in an invalid format and cannot be displayed."
    )
}
