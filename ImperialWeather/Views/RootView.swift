//
//  RootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct RootView: View {
    @StateObject private var weatherViewModel = WeatherViewModel(service: WeatherService())
    @StateObject private var locationViewModel = LocationViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            switch locationViewModel.authorizationStatus {
            case .notDetermined:
                EmptyView()
            case .restricted, .denied:
                LocationPermissionScreen()
            case .authorizedAlways, .authorizedWhenInUse:
                showWeatherView
            @unknown default:
                EmptyView()
            }
        }
        .task {
            guard let location = locationViewModel.location else {
                weatherViewModel.loadingState = .failed(.badLocation)
                return
            }
            await weatherViewModel.fetchWeather(for: location)
        }
    }
    
    @ViewBuilder private var showWeatherView: some View {
        switch weatherViewModel.loadingState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded:
            WeatherScreen(viewModel: weatherViewModel)
        case .failed(let error):
            ErrorScreen(error: error)
        }
    }
}
