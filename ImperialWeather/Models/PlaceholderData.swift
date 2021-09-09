//
//  PlaceholderData.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct PlaceholderData {
    static let coordinates = Coordinates(longitude: 0.0, latitude: 0.0)
    static let currentWeatherDescription = [WeatherDescription(id: 100, description: "-")]
    static let conditions = Conditions(temperature: 12.0)
    static let location = "-"
    
    static let currentWeather = CurrentWeather(
        coordinates: coordinates, description: currentWeatherDescription, conditions: conditions, location: location
    )
    
    static let upcomingWeatherDescription = [WeatherDescription(id: 100, description: "-")]
    
    static let upcomingWeather = UpcomingWeather(
        hourlyWeather: [HourlyWeather(hour: Date(), temperature: 0, description: upcomingWeatherDescription)],
        dailyWeather: [DailyWeather(day: Date(), temperature: Temperature(min: 0, max: 0), description: upcomingWeatherDescription)]
    )
}
