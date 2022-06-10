//
//  HelperFunctions.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

enum ButtonAction {
    static func launchAppSettings() {
        guard let bundleId = Bundle.main.bundleIdentifier else { return }
        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")!
        UIApplication.shared.open(url)
    }
    
    static func submitFeedback() {
        let url = URL(string: "mailto:INSERTEMAILHERE")!
        UIApplication.shared.open(url)
    }
}
