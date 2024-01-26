//
//  InvalidURLMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct InvalidURLMessage: ErrorMessage {
    var image: String { ErrorSymbol.networkError }
    var title: String { ErrorTitle.invalidURL }
    var description: String { ErrorDescription.invalidURL }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { ButtonAction.submitFeedback }
}
