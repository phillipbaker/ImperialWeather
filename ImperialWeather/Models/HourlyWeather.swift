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
        let currentTime = Date()
        if hour <= currentTime {
            return "Now"
        } else {
            return DateFormatter.hourFormat.string(from: hour)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case hour = "dt"
        case temperature = "temp"
        case description = "weather"
    }
}
