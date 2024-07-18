//
//  HomeView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Color.classicBackground.ignoresSafeArea()

            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let weather):
                WeatherView(weather: weather)
            case .error(let error):
                ErrorView(error: error)
            }
        }
        .task {
            await viewModel.handleIntent(intent: HomeIntent.getWeather)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
