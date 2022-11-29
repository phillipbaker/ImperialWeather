//
//  WeatherScreen.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct WeatherScreen: View {
    @ObservedObject private(set) var viewModel: WeatherViewModel
    
    var body: some View {
        switch viewModel.loadingState {
        case .none, .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded:
            WeatherView(viewModel: viewModel)
        case .failed(let error):
            ErrorView(error: error)
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScreen(viewModel: .init())
            .backgroundView()
    }
}
