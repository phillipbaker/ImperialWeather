//
//  NetworkErrorMessages.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 27/06/2024.
//

import Foundation

struct InvalidURLMessage: ErrorMessage {
    var image: String { ErrorSymbol.dataError }
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
