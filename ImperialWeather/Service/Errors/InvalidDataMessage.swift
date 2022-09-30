//
//  InvalidDataMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

struct InvalidDataMessage: ErrorMessage {
    var image: String { "xmark.octagon" }
    
    var title: String { "Invalid Data" }
    
    var description: String { "Imperial Weather could not create a forecast from the data provided." }
    
    var buttonTitle: String { "Report This Problem" }
    
    var buttonAction: () -> Void { ButtonAction.submitFeedback }
}
