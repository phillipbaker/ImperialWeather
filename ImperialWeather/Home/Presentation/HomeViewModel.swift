//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

@MainActor final class HomeViewModel: ObservableObject {
    let getWeatherUseCase = GetWeather(source: GetWeatherSourceImpl(
        locationDataSourceLocal: LocationLocalDataGateway(service: LocationServiceImpl()),
        weatherDataSourceRemote: WeatherRemoteDataGateway(service: WeatherServiceImpl()))
    )
    
    @Published var state: HomeState = .loading
    
    func handleIntent(intent: HomeIntent) async {
        switch intent {
        case .GetWeather:
            await getWeather()
        }
    }
    
    private func getWeather() async {
        do {
            state = .success(try await getWeatherUseCase.weather())
        } catch LocationError.coordinateError {
            state = .error(LocationError.coordinateError.message)
        } catch LocationError.geocodingError {
            state = .error(LocationError.geocodingError.message)
        } catch LocationError.permissionError {
            state = .error(LocationError.permissionError.message)
        } catch NetworkError.invalidUrl {
            state = .error(NetworkError.invalidUrl.message)
        } catch NetworkError.networkError {
            state = .error(NetworkError.networkError.message)
        } catch NetworkError.invalidResponse {
            state = .error(NetworkError.invalidResponse.message)
        } catch NetworkError.invalidData {
            state = .error(NetworkError.invalidData.message)
        } catch {
            state = .error(NetworkError.invalidData.message)
        }
    }
}
