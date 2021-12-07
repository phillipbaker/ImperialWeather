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
                ErrorScreen(error: .locationPermission)
            case .authorizedAlways, .authorizedWhenInUse:
                showWeather
            @unknown default:
                EmptyView()
            }
        }
        .task {
            locationViewModel.requestPermission()
            guard let location = locationViewModel.location else {
                weatherViewModel.loadingState = .failed(.locationError)
                return
            }
            await weatherViewModel.fetchWeather(for: location)
        }
    }
    
    @ViewBuilder private var showWeather: some View {
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
