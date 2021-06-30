//
//  TestData.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct TestData {
    static let coordinates = Coordinates(longitude: 42.0, latitude: 23.0)
    static let currentWeatherDescription = [WeatherDescription(id: 201, description: "Clear")]
    static let conditions = Conditions(temperature: 12.0)
    static let location = "Joydens Wood"
    
    static let currentWeather = CurrentWeather(
        coordinates: coordinates, description: currentWeatherDescription, conditions: conditions, location: location
    )
    
    static let upcomingWeatherDescription = [WeatherDescription(id: 202, description: "Rain")]
    
    static let upcomingWeather = UpcomingWeather(
        hourlyWeather: [HourlyWeather(hour: Date(), temperature: 10.0, description: upcomingWeatherDescription)],
        dailyWeather: [DailyWeather(day: Date(), temperature: Temperature(min: 12.0, max: 19.0), description: upcomingWeatherDescription)]
    )
}
