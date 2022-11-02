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
        .init(day: Date.now, temperature: Temperature(min: 22.0, max: 32.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!, temperature: Temperature(min: 23.0, max: 34.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 2, to: Date.now)!, temperature: Temperature(min: 24.0, max: 36.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!, temperature: Temperature(min: 26.0, max: 36.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 4, to: Date.now)!, temperature: Temperature(min: 20.0, max: 32.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 5, to: Date.now)!, temperature: Temperature(min: 22.0, max: 33.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 6, to: Date.now)!, temperature: Temperature(min: 19.0, max: 29.0), description: [WeatherDescription.previewData]),
        .init(day: Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!, temperature: Temperature(min: 16.0, max: 27.0), description: [WeatherDescription.previewData])
    ]
}
