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
        ZStack {
            Color.weatherBackground
                .ignoresSafeArea()
            
            switch viewModel.authorizationStatus {
            case .restricted, .denied:
                ErrorScreen(error: .locationPermission)
            case .authorizedAlways, .authorizedWhenInUse:
                WeatherScreen(viewModel: viewModel)
            case .notDetermined:
                EmptyView()
            @unknown default:
                ErrorScreen(error: .locationError)
            }
        }
    }
}
