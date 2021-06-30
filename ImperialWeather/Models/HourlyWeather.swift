//
//  HourlyWeather.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/30/21.
//

import Foundation

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
