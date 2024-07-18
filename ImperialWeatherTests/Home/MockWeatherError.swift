//
//  MockWeatherError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

enum MockWeatherError: Error, WeatherError {
    case unknownError

    var message: any ErrorMessage {
        return MockWeatherErrorMessage()
    }
}

struct MockWeatherErrorMessage: ErrorMessage {
    var image: String { ErrorSymbol.networkError }
    var title: String { ErrorTitle.networkError }
    var description: String { ErrorDescription.networkError }
    var buttonTitle: String { ErrorButtonTitle.networkError }
    var buttonAction: () async -> Void { Application.live.launchAppSettings }
}
