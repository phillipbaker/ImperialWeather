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
            return "cloud.bolt.rain.fill"
        case 211:
            return "cloud.bolt.fill"
        case 300, 310, 313:
            return "cloud.drizzle.fill"
        case 301, 311, 321:
            return "cloud.rain.fill"
        case 302, 312, 314:
            return "cloud.heavyrain.fill"
        case 500, 501, 520, 521:
            return "cloud.rain.fill"
        case 502, 503, 504, 522, 531:
            return "cloud.heavyrain.fill"
        case 511:
            return "snowflake"
        case 600...602:
            return "cloud.snow.fill"
        case 611...622:
            return "cloud.sleet.fill"
        case 701:
            return "cloud.fog.fill"
        case 711, 762:
            return "smoke.fill"
        case 721:
            return "sun.haze.fill"
        case 731, 751, 761:
            return "sun.dust.fill"
        case 741:
            return "cloud.fog.fill"
        case 771:
            return "cloud.heavyrain.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "exclamationmark.triangle.fill"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "main"
    }
}
