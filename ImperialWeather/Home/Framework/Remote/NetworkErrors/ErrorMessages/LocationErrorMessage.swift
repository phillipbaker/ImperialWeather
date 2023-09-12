//
//  LocationErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct LocationErrorMessage: ErrorMessage {
    var image: String { ErrorSymbol.locationError }
    var title: String { ErrorTitle.locationError }
    var description: String { ErrorDescription.locationError }
    var buttonTitle: String { ErrorButtonTitle.locationPermission }
    var buttonAction: () -> Void { ButtonAction.launchAppSettings }
}
