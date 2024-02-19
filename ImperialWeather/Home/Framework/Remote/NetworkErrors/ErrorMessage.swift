//
//  ErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

protocol ErrorMessage {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var buttonTitle: String { get }
    var buttonAction: () async -> Void { get }
}

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

struct InvalidURLMessage: ErrorMessage {
    var image: String { ErrorSymbol.networkError }
    var title: String { ErrorTitle.invalidURL }
    var description: String { ErrorDescription.invalidURL }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { Application.live.submitFeedback }
}

struct NetworkErrorMessage: ErrorMessage {
    var image: String { ErrorSymbol.networkError }
    var title: String { ErrorTitle.networkError }
    var description: String { ErrorDescription.networkError }
    var buttonTitle: String { ErrorButtonTitle.networkError }
    var buttonAction: () async -> Void { Application.live.launchAppSettings }
}

struct InvalidResponseMessage: ErrorMessage {
    var image: String { ErrorSymbol.dataError }
    var title: String { ErrorTitle.invalidResponse }
    var description: String { ErrorDescription.invalidResponse }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { Application.live.submitFeedback }
}

struct InvalidDataMessage: ErrorMessage {
    var image: String { ErrorSymbol.dataError }
    var title: String { ErrorTitle.invalidData }
    var description: String { ErrorDescription.invalidData }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { Application.live.submitFeedback }
}
