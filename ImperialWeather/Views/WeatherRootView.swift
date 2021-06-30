//
//  WeatherRootView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

struct WeatherRootView: View {
    @StateObject private var dataModel = WeatherDataModel()
    
    var body: some View {
        switch dataModel.loadingState {
        case .idle:
            Color.clear
        case .loading:
            ProgressView()
        case .loaded:
            WeatherContentView(dataModel: dataModel)
        case .failed(let error):
            ErrorView(error: error)
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
