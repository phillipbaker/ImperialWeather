//
//  NetworkErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct NetworkErrorMessage: ErrorMessage {
    var image: String { ErrorSymbol.networkError }
    var title: String { ErrorTitle.networkError }
    var description: String { ErrorDescription.networkError }
    var buttonTitle: String { ErrorButtonTitle.networkError }
    var buttonAction: () async -> Void { ButtonAction.launchAppSettings }
}
