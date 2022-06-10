//
//  ErrorMessages.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import Foundation

enum LocationError {
    static let image = "location.slash"
    static let title = "Unable to Establish Your Location"
    static let description = "Imperial Weather was unable to establish your location."
    static let buttonTitle = "Check Location Permissions in Settings"
}

enum NetworkError {
    static let image = "wifi.exclamationmark"
    static let title = "You Are Not Connected to the Internet"
    static let description = "The weather can’t be displayed because your device is currently offline."
    static let buttonTitle = "Check network connection in Settings"
}

enum InvalidResponse {
    static let image = "xmark.octagon"
    static let title = "Invalid APIKey"
    static let description = "Imperial Weather could not retrieve a forecast from the weather provider."
    static let buttonTitle = "Report This Problem"
}

enum InvalidData {
    static let image = "xmark.octagon"
    static let title = "Invalid Data"
    static let description = "Imperial Weather could not create a forecast from the data provided."
    static let buttonTitle = "Report This Problem"
}

enum LocationPermission {
    static let image = "location.slash"
    static let title = "Imperial Weather Cannot Access Your Location"
    static let description = "Imperial Weather needs your location to show you the weather where you are. Your location data is not stored by the app."
    static let buttonTitle = "Turn On Location Services in Settings"
}
