//
//  InvalidResponseMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

struct InvalidResponseMessage: ErrorMessage {
    var image: String { "xmark.octagon" }
    
    var title: String { "Invalid APIKey" }
    
    var description: String { "Imperial Weather could not retrieve a forecast from the weather provider." }
    
    var buttonTitle: String { "Report This Problem" }
    
    var buttonAction: () -> Void { ButtonAction.submitFeedback }
}
