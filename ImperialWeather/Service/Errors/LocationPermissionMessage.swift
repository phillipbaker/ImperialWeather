//
//  LocationPermissionMessage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/29/22.
//

import Foundation

struct LocationPermissionMessage: ErrorMessage {
    var image: String { "location.slash" }
    
    var title: String { "Imperial Weather Cannot Access Your Location" }
    
    var description: String { "Imperial Weather needs your location to show you the weather where you are." }
    
    var buttonTitle: String { "Turn On Location Services in Settings" }
    
    var buttonAction: () -> Void { ButtonAction.launchAppSettings }
}
