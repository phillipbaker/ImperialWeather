//
//  HomeView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private(set) var viewModel: HomeViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .success(let weather):
            WeatherView(weather: weather)
        case .error(let error):
            ErrorView(error: error)
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(latitude: "0.0", longitude: "0.0"))
            .backgroundView()
    }
}
