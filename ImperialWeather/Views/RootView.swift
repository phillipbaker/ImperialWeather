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
        switch viewModel.loadingState {
        case .idle:
            Color.weatherBackground
                .edgesIgnoringSafeArea(.all)
        case .loading:
            LoadingView()
        case .loaded:
            WeatherView(viewModel: viewModel)
        case .failed(let error):
            ErrorView(error: error)
        case .locationDenied:
            PermissionView()
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
