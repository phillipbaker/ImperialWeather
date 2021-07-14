//
//  PermissionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import SwiftUI

struct PermissionView: View {
    var body: some View {
        VStack(spacing: 72) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Imperial Weather needs your location to show the weather where you are.")
                    .font(.headline)
                Text("Your location data is only used to display weather information and is not stored by the app.")
                    .foregroundColor(.secondary)
            }
            
            Button("Turn On Location Services in Settings") {
                launchAppSettings()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
    
    func launchAppSettings() {
        if let bundleId = Bundle.main.bundleIdentifier,
           let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}
