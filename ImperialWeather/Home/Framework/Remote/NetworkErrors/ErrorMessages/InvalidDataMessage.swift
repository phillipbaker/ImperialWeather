//
//  InvalidDataMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

struct InvalidDataMessage: ErrorMessage {
    var image: String { ErrorSymbol.dataError }
    var title: String { ErrorTitle.invalidData }
    var description: String { ErrorDescription.invalidData }
    var buttonTitle: String { ErrorButtonTitle.reportProblem }
    var buttonAction: () async -> Void { ButtonAction.submitFeedback }
}
