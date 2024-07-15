//
//  HomeViewModelTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather
import Testing

@MainActor
struct HomeViewModelTests {
    @Test(arguments: zip(MockWeatherSource.Response.allCases, MockWeatherSource.allValues))
    func handleGetWeatherIntent(response: MockWeatherSource.Response, value: HomeState) async {
        let homeViewModel = HomeViewModel(getWeatherUseCase: GetWeather(source: MockWeatherSource(response: response)))
        await homeViewModel.handleIntent(intent: .GetWeather)
        #expect(homeViewModel.state == value)
    }
    
    @Test func homeStateInequality() async {
        let homeViewModel = HomeViewModel(getWeatherUseCase: GetWeather(source: MockWeatherSource(response: .success)))
        await homeViewModel.handleIntent(intent: .GetWeather)
        #expect(homeViewModel.state != .error(LocationError.locationError))
    }
}
