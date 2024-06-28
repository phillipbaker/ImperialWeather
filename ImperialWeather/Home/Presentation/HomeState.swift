//
//  HomeState.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import Foundation

enum HomeState {
    case loading
    case success(HomeWeather)
    case error(ErrorMessage)
}
