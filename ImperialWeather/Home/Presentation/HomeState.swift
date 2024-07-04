//
//  HomeState.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import Foundation

enum HomeState: Equatable {
    case loading
    case success(HomeWeather)
    case error(WeatherError)
    
    static func == (lhs: HomeState, rhs: HomeState) -> Bool {
        switch (lhs, rhs) {
        case (.success(let lhs), .success(let rhs)):
            return lhs == rhs
        case (.error(let lhs), .error(let rhs)):
            return lhs.message.title == rhs.message.title && lhs.message.description == rhs.message.description
        default:
            return false
        }
    }
}
