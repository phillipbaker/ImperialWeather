//
//  LoadingScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct LoadingScreen: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        switch viewModel.loadingState {
        case .none, .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded:
            WeatherScreen(viewModel: viewModel)
        case .failed(let error):
            ErrorScreen(error: error)
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen(viewModel: .init())
            .backgroundView()
    }
}
