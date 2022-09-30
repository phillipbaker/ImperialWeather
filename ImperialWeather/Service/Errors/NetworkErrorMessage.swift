//
//  NetworkErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

struct NetworkErrorMessage: ErrorMessage {
    var image: String { "wifi.exclamationmark" }
    
    var title: String { "You Are Not Connected to the Internet"  }
    
    var description: String { "The weather can’t be displayed because your device is currently offline." }
    
    var buttonTitle: String { "Check network connection in Settings" }
    
    var buttonAction: () -> Void { ButtonAction.launchAppSettings }
}
