//
//  LocationPermissionMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct LocationPermissionMessage: ErrorMessage {
    var image: String { ErrorSymbol.locationError }
    var title: String { ErrorTitle.locationPermission }
    var description: String { ErrorDescription.locationPermission }
    var buttonTitle: String { ErrorButtonTitle.locationServices }
    var buttonAction: () async -> Void { ButtonAction.launchAppSettings }
}
