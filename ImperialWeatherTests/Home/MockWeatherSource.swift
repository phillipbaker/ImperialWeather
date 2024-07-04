//
//  MockWeatherSource.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

@testable import ImperialWeather

final class MockWeatherSource: GetWeatherSource {
    enum Response: CaseIterable {
        case success
        case coordinateError
        case geocodingError
        case permissionError
        case invalidUrl
        case networkError
        case invalidResponse
        case invalidData
        case unknownError
    }
    
    static var allValues: [HomeState] = [
        .success(HomeWeather.mock),
        .error(LocationError.coordinateError),
        .error(LocationError.geocodingError),
        .error(LocationError.permissionError),
        .error(NetworkError.invalidUrl),
        .error(NetworkError.networkError),
        .error(NetworkError.invalidResponse),
        .error(NetworkError.invalidData),
        .error(NetworkError.invalidData)
    ]
    
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
    
    func weather() async throws -> HomeWeatherLocationPlain {
        switch response {
        case .success:
            return HomeWeatherLocationPlain.mock
        case .coordinateError:
            throw LocationError.coordinateError
        case .geocodingError:
            throw LocationError.geocodingError
        case .permissionError:
            throw LocationError.permissionError
        case .invalidUrl:
            throw NetworkError.invalidUrl
        case .networkError:
            throw NetworkError.networkError
        case .invalidResponse:
            throw NetworkError.invalidResponse
        case .invalidData:
            throw NetworkError.invalidData
        case .unknownError:
            throw MockWeatherError.unknownError
        }
    }
}
