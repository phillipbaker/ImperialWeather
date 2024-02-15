//
//  Application.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct Application {
    var submitFeedback: () -> Void
    var launchAppSettings: () -> Void
}

extension Application {
    static let live = Self(
        submitFeedback: {
            let url = URL(string: "mailto:INSERTEMAILHERE")!
            Task { await MainActor.run { UIApplication.shared.open(url) } }
        },
        launchAppSettings: {
            guard let bundleId = Bundle.main.bundleIdentifier else { return }
            
            Task {
                await MainActor.run {
                    let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")!
                    UIApplication.shared.open(url)
                }
            }
        }
    )
}
