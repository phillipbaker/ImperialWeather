//
//  LoadingState.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import Foundation

enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case locationDenied
    case failed(WeatherError)
}
