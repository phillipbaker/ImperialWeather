//
//  LocationErrorMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

struct LocationErrorMessage: ErrorMessage {
    var image: String { "location.slash" }
    
    var title: String { "Unable to Establish Your Location" }
    
    var description: String { "Imperial Weather was unable to establish your location." }
    
    var buttonTitle: String { "Check Location Permissions in Settings" }
    
    var buttonAction: () -> Void { ButtonAction.launchAppSettings }
}
