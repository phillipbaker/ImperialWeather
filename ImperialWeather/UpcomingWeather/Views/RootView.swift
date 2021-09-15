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
            BackgroundView()
            
            switch viewModel.loadingState {
            case .idle:
                IdleView()
            case .loading:
                LoadingView()
            case .loaded:
                WeatherScreen(viewModel: viewModel)
            case .failed(let error):
                ErrorScreen(error: error)
            case .locationDenied:
                LocationPermissionScreen()
            }
        }
    }
}
