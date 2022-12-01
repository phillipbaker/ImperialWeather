//
//  RootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        switch viewModel.authorizationStatus {
        case .restricted, .denied, .notDetermined:
            ErrorView(error: .locationPermission)
        case .authorizedAlways, .authorizedWhenInUse:
            HomeView(viewModel: viewModel)
        @unknown default:
            ErrorView(error: .locationError)
        }
    }
}
