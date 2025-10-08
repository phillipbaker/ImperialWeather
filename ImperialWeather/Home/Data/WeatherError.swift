//
//  WeatherError.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 04/07/2024.
//

protocol WeatherError: Sendable {
    var message: ErrorMessage { get }
}
