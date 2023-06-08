//
//  WeatherLabel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/19/23.
//

import Foundation

enum WeatherLabel {
    static let now = NSLocalizedString(
        "Now",
        tableName: "WeatherLabel",
        comment: "Label for the current hour’s weather forecast."
    )
    
    static let done = NSLocalizedString(
        "Done",
        tableName: "WeatherLabel",
        comment: "Generic button title to confirm an action."
    )
    
    static let source = NSLocalizedString(
        "Source: OpenWeather",
        tableName: "WeatherLabel",
        comment: "A label that denotes the source of weather data."
    )
    
    static let unknownLocation = NSLocalizedString(
        "Unknown Location",
        tableName: "WeatherLabel",
        comment: "Label displayed when the location name is missing from a forecast."
    )
    
    static let hourlyForecast = NSLocalizedString(
        "Hourly Forecast",
        tableName: "WeatherLabel",
        comment: "Label for the hourly weather forecast."
    )
    
    static let dailyForecast = NSLocalizedString(
        "Daily Forecast",
        tableName: "WeatherLabel",
        comment: "Label for the chart that shows daily weather for the upcoming week."
    )
    
    static let sevenDayForecast = NSLocalizedString(
        "7-Day Forecast",
        tableName: "WeatherLabel",
        comment: "Label for the daily weather forecast for the next seven days."
    )
    
    static let day = NSLocalizedString(
        "Day",
        tableName: "WeatherLabel",
        comment: "Label for the x-axis of weather chart that shows days of the week."
    )
    
    static let temperature = NSLocalizedString(
        "Temperature",
        tableName: "WeatherLabel",
        comment: "Label for the y-axis of weather chart that shows temperature data."
    )
    
    static let celsius = NSLocalizedString(
        "degrees Celsius",
        tableName: "WeatherLabel",
        comment: "Label instructing VoiceOver to read ‘Celsius‘ in full instead of ‘ºC’."
    )
    
    static let fahrenheit = NSLocalizedString(
        "degrees Fahrenheit",
        tableName: "WeatherLabel",
        comment: "Label instructing VoiceOver to read ‘Fahrenheit’ in full instead of ‘ºF’."
    )
    
    static let temperatureScalePicker = NSLocalizedString(
        "Temperature Scale Picker",
        tableName: "WeatherLabel",
        comment: "Label for the segmented control that selects the primary temperature scale (Celsius or Fahrenheit)."
    )
}
