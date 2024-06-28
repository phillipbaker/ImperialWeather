//
//  ImperialWeatherApp.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import SwiftUI

@main
struct ImperialWeatherApp: App {
    @StateObject var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel)
        }
    }
}
