//
//  PreviewData.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/11/22.
//

import Foundation

extension CurrentWeather {
    static let previewData: CurrentWeather = .init(
        coordinates: Coordinates(longitude: 0.0, latitude: 0.0),
        description: [WeatherDescription.previewData],
        conditions: Conditions(temperature: 100.0),
        location: "Test Location"
    )
}

extension WeatherDescription {
    static let previewData: WeatherDescription = .init(description: "Clear", icon: "sun.max", id: 300)
}

extension UpcomingWeather {
    static let previewData: UpcomingWeather = .init(hourlyWeather: HourlyWeather.previewData, dailyWeather: DailyWeather.previewData)
}

extension HourlyWeather {
    static let previewData: [HourlyWeather] = [
        .init(hour: Date.now, temperature: 79.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 1, to: Date.now)!, temperature: 77.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 2, to: Date.now)!, temperature: 77.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 3, to: Date.now)!, temperature: 77.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 4, to: Date.now)!, temperature: 76.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 5, to: Date.now)!, temperature: 75.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 6, to: Date.now)!, temperature: 75.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 7, to: Date.now)!, temperature: 74.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 8, to: Date.now)!, temperature: 73.0, description: [WeatherDescription.previewData]),
        .init(hour: Calendar.current.date(byAdding: .hour, value: 9, to: Date.now)!, temperature: 73.0, description: [WeatherDescription.previewData])
    ]
}

extension DailyWeather {
    static let previewData: [DailyWeather] = [
        .init(day: Date.now, temperature: Temperature(min: 72.0, max: 92.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!, temperature: Temperature(min: 73.0, max: 97.0), description: [WeatherDescription.previewData])
    ]
}
