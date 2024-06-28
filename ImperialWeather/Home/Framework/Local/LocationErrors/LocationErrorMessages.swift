//
//  LocationErrorMessages.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 27/06/2024.
//

import Foundation

struct LocationPermissionMessage: ErrorMessage {
    var image: String { ErrorSymbol.locationError }
    var title: String { ErrorTitle.locationPermission }
    var description: String { ErrorDescription.locationPermission }
    var buttonTitle: String { ErrorButtonTitle.locationServices }
    var buttonAction: () async -> Void { Application.live.launchAppSettings }
}

struct LocationErrorMessage: ErrorMessage {
    var image: String { ErrorSymbol.locationError }
    var title: String { ErrorTitle.locationError }
    var description: String { ErrorDescription.locationError }
    var buttonTitle: String { ErrorButtonTitle.locationPermission }
    var buttonAction: () async -> Void { Application.live.launchAppSettings }
}
