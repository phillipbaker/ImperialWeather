//
//  HelperFunctions.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

enum ButtonAction {
    @MainActor static func launchAppSettings() async {
        guard let bundleId = Bundle.main.bundleIdentifier else { return }
        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")!
        Task { await UIApplication.shared.open(url) }
    }
    
    @MainActor static func submitFeedback() async {
        let url = URL(string: "mailto:INSERTEMAILHERE")!
        Task { await UIApplication.shared.open(url) }
    }
}
