//
//  InvalidURLMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/4/22.
//

import Foundation

struct InvalidURLMessage: ErrorMessage {
    var image: String { "location.slash" }
    
    var title: String { "Invalid URL" }
    
    var description: String { "Imperial Weather could not access weather at this URL" }
    
    var buttonTitle: String { "Report This Problem" }
    
    var buttonAction: () -> Void { ButtonAction.submitFeedback }
}
