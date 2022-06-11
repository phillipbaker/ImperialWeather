//
//  PreviewData.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/11/22.
//

import Foundation

enum PreviewData {
    static let current = CurrentWeather(
        coordinates: Coordinates(longitude: 0.0, latitude: 0.0),
        description: weatherDescription,
        conditions: Conditions(temperature: 100.0),
        location: "Test Location"
    )
    
    static let upcoming = UpcomingWeather(hourlyWeather: hourly, dailyWeather: daily)
    
    static let hourly: [HourlyWeather] = [
        .init(hour: now, temperature: 79.0, description: weatherDescription),
        .init(hour: in1Hour, temperature: 77.0, description: weatherDescription),
        .init(hour: in2Hours, temperature: 77.0, description: weatherDescription),
        .init(hour: in3Hours, temperature: 76.0, description: weatherDescription),
        .init(hour: in4Hours, temperature: 75.0, description: weatherDescription),
        .init(hour: in5Hours, temperature: 75.0, description: weatherDescription),
        .init(hour: in6Hours, temperature: 74.0, description: weatherDescription),
        .init(hour: in7Hours, temperature: 73.0, description: weatherDescription),
        .init(hour: in8Hours, temperature: 73.0, description: weatherDescription),
        .init(hour: in9Hours, temperature: 73.0, description: weatherDescription),
    ]
    
    static var daily: [DailyWeather] = [
        .init(day: tomorrow,temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in2Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in3Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in4Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in5Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in6Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription),
        .init(day: in7Days, temperature: Temperature(min: 73.0, max: 97.0), description: weatherDescription)
    ]
    
    static let weatherDescription: [WeatherDescription] = [
        .init(description: "Clear", icon: "sun.max", id: 300)
    ]
    
    /// Hours
    static let now = Date()
    static let in1Hour =  Calendar.current.date(byAdding: .hour, value: 1, to: now)!
    static let in2Hours = Calendar.current.date(byAdding: .hour, value: 2, to: now)!
    static let in3Hours = Calendar.current.date(byAdding: .hour, value: 3, to: now)!
    static let in4Hours = Calendar.current.date(byAdding: .hour, value: 4, to: now)!
    static let in5Hours = Calendar.current.date(byAdding: .hour, value: 5, to: now)!
    static let in6Hours = Calendar.current.date(byAdding: .hour, value: 6, to: now)!
    static let in7Hours = Calendar.current.date(byAdding: .hour, value: 7, to: now)!
    static let in8Hours = Calendar.current.date(byAdding: .hour, value: 8, to: now)!
    static let in9Hours = Calendar.current.date(byAdding: .hour, value: 9, to: now)!
    
    /// Days
    static let today = Date()
    static let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
    static let in2Days =  Calendar.current.date(byAdding: .day, value: 2, to: today)!
    static let in3Days =  Calendar.current.date(byAdding: .day, value: 3, to: today)!
    static let in4Days =  Calendar.current.date(byAdding: .day, value: 4, to: today)!
    static let in5Days =  Calendar.current.date(byAdding: .day, value: 5, to: today)!
    static let in6Days =  Calendar.current.date(byAdding: .day, value: 6, to: today)!
    static let in7Days =  Calendar.current.date(byAdding: .day, value: 7, to: today)!
}
