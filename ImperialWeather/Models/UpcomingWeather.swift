//
//  UpcomingWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/25/21.
//

import Foundation

struct UpcomingWeather: Codable {
    let hourlyWeather: [HourlyWeather]
    let dailyWeather: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        case hourlyWeather = "hourly"
        case dailyWeather = "daily"
    }
}

struct HourlyWeather: Codable, Identifiable {
    let id = UUID()
    let hour: Date
    let temperature: Double
    let description: [WeatherDescription]
    var formattedHour: String {
        return DateFormatter.hourFormat.string(from: hour)
    }
    
    var celsiusString: String {
        return String(format: "%.0f", temperature)
    }
    
    var fahrenheitString: String {
        return String(format: "%.0f",(temperature * 1.8) + 32)
    }
    
    enum CodingKeys: String, CodingKey {
        case hour = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}

struct DailyWeather: Codable, Identifiable {
    let id = UUID()
    let day: Date
    let temperature: Temperature
    let description: [WeatherDescription]
    
    var formattedDay: String {
        return DateFormatter.dayFormat.string(from: day)
    }
    
    enum CodingKeys: String, CodingKey {
        case day = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}

struct Temperature: Codable {
    let min: Double
    let max: Double
    
    var minCelsiusString: String {
        return String(format: "%.0f", min)
    }
    
    var maxCelsiusString: String {
        return String(format: "%.0f", max)
    }
    
    var minFahrenheitString: String {
        return String(format: "%.0f",(min * 1.8) + 32)
    }
    
    var maxFahrenheitString: String {
        return String(format: "%.0f",(max * 1.8) + 32)
    }
}
