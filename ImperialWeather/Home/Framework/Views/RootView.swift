//
//  RootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct RootView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        switch locationManager.authorizationStatus {
        case .restricted, .denied, .notDetermined:
            ErrorView(error: .locationPermission)
        case .authorizedAlways, .authorizedWhenInUse:
            if let latitude = locationManager.latitude, let longitude = locationManager.longitude {
                HomeView(viewModel: HomeViewModel(latitude: latitude, longitude: longitude))
            }
        @unknown default:
            ErrorView(error: .locationError)
        }
    }
}
