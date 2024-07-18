//
//  WeatherViewModel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

@MainActor final class HomeViewModel: ObservableObject {
    let getWeatherUseCase: GetWeather

    @Published var state: HomeState = .loading

    init(
        getWeatherUseCase: GetWeather = GetWeather(
            source: GetWeatherSourceImpl(
                locationDataSourceLocal: LocationLocalDataGateway(
                    service: LocationServiceImpl()
                ),
                weatherDataSourceRemote: WeatherRemoteDataGateway(
                    service: WeatherServiceImpl()
                )
            )
        )
    ) {
        self.getWeatherUseCase = getWeatherUseCase
    }

    func handleIntent(intent: HomeIntent) async {
        switch intent {
        case .getWeather:
            await getWeather()
        }
    }

    private func getWeather() async {
        do {
            state = .success(try await getWeatherUseCase.weather())
        } catch GeocodingError.geocodingError {
            state = .error(GeocodingError.geocodingError)
        } catch LocationError.locationError {
            state = .error(LocationError.locationError)
        } catch LocationError.permissionError {
            state = .error(LocationError.permissionError)
        } catch NetworkError.invalidUrl {
            state = .error(NetworkError.invalidUrl)
        } catch NetworkError.networkError {
            state = .error(NetworkError.networkError)
        } catch NetworkError.invalidResponse {
            state = .error(NetworkError.invalidResponse)
        } catch NetworkError.invalidData {
            state = .error(NetworkError.invalidData)
        } catch {
            state = .error(NetworkError.invalidData)
        }
    }
}
