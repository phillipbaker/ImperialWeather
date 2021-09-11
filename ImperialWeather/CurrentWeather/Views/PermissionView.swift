//
//  PermissionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import SwiftUI

struct PermissionView: View {
    var body: some View {
        ZStack {
            Color.weatherBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 32) {
                Image(systemName: "location.slash.fill")
                    .font(.system(size: 128))
                VStack(alignment: .leading, spacing: 8) {
                    Text("Imperial Weather Cannot Access Your Location")
                        .font(.headline)
                    Text("Imperial Weather needs your location to show you the weather where you are. Your location data is not stored by the app.")
                        .foregroundColor(.secondary)
                }
                .multilineTextAlignment(.center)

                Button("Turn On Location Services in Settings") {
                    launchAppSettings()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .paneBackground()
            .padding()
        }
    }

    func launchAppSettings() {
        if let bundleId = Bundle.main.bundleIdentifier,
           let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.weatherBackground
                .edgesIgnoringSafeArea(.all)
            PermissionView()
        }
    }
}
