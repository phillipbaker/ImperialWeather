//
//  Application.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct Application {
    var submitFeedback: @Sendable () async -> Void
    var launchAppSettings: @Sendable () async -> Void
}

extension Application {
    static let live = Self(
        submitFeedback: {
            guard let url = URL(string: "mailto:INSERTEMAILHERE") else { return }
            UIApplication.shared.open(url)
        },
        launchAppSettings: {
            guard let bundleId = Bundle.main.bundleIdentifier else { return }
            guard let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") else { return }
            UIApplication.shared.open(url)
        }
    )
}
