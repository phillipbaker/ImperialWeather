//
//  WeatherDescription.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct WeatherDescription: Codable {
    let id: Int
    let description: String
    
    var lowercasedDescription: String {
        return description.lowercased()
    }
    
    var conditionName: String {
        switch id {
        case 200...210, 212...232:
            return "cloud.bolt.rain"
        case 211:
            return "cloud.bolt"
        case 300, 310, 313:
            return "cloud.drizzle"
        case 301, 311, 321:
            return "cloud.rain"
        case 302, 312, 314:
            return "cloud.heavyrain"
        case 500, 501, 520, 521:
            return "cloud.rain"
        case 502, 503, 504, 522, 531:
            return "cloud.heavyrain"
        case 511:
            return "snowflake"
        case 600...602:
            return "cloud.snow"
        case 611...622:
            return "cloud.sleet"
        case 701:
            return "aqi.low"
        case 711, 762:
            return "smoke"
        case 721:
            return "sun.haze"
        case 731, 751, 761:
            return "sun.dust"
        case 741:
            return "cloud.fog"
        case 771:
            return "cloud.heavyrain"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "exclamationmark.triangle"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "main"
    }
}
