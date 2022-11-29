//
//  RootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        switch viewModel.authorizationStatus {
        case .restricted, .denied, .notDetermined:
            ErrorView(error: .locationPermission)
        case .authorizedAlways, .authorizedWhenInUse:
            WeatherScreen(viewModel: viewModel)
        @unknown default:
            ErrorView(error: .locationError)
        }
    }
}
