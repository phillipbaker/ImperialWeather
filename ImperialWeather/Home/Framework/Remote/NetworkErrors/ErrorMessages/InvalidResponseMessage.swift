//
//  InvalidResponseMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct InvalidResponseMessage: ErrorMessage {
    var image: String { ErrorSymbol.dataError }
    var title: String { ErrorTitle.invalidResponse }
    var description: String { ErrorDescription.invalidResponse }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { ButtonAction.submitFeedback }
}
