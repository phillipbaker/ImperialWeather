//
//  ErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import Foundation

enum ErrorMessage {
    // MARK: - Bad Location
    static let badLocationImage = "location.slash"
    static let badLocationTitle = "Unable to Establish Your Location"
    static let badLocationDescription = "Imperial Weather was unable to establish your location"
    static let badLocationButtonTitle = "Retry"

    // MARK: - Network Error
    static let networkErrorImage = "wifi.exclamationmark"
    static let networkErrorTitle = "You Are Not Connected to the Internet"
    static let networkErrorDescription = "The weather can’t be displayed because your device is currently offline."
    static let networkErrorButtonTitle = ""

    // MARK: - Invalid Response
    static let invalidDataOrResponseImage = "xmark.octagon"
    static let invalidResponseTitle = "Invalid Response"
    static let invalidResponseDescription = ""
    static let invalidResponseButtonTitle = "Retry"

    // MARK: - Invalid Data
    static let invalidDataTitle = "Invalid Data"
    static let invalidDataDescription = ""
    static let invalidDataButtonTitle = "Retry"
    
    // MARK: - Location Permission
    static let locationPermissionTitle = "Imperial Weather Cannot Access Your Location"
    static let locationPermissionDescription = "Imperial Weather needs your location to show you the weather where you are. Your location data is not stored by the app."
    static let loactionPermissionButtonTitle = "Turn On Location Services in Settings"
}