
//
//  WeatherDescriptionRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct WeatherDescriptionRaw: Codable {
    let description: String
    let icon: String
    let id: Int
    
    static func mapFirstDescription(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.description ?? "No Description"
    }
    
    static func mapFirstIcon(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.mapIcon() ?? WeatherIcon.placeholder
    }
    
    func mapIcon() -> String {
        switch id {
        case 200...210, 212...232:
            return WeatherIcon.thunderstorm
        case 211:
            return WeatherIcon.lightning
        case 300, 310, 313:
            return WeatherIcon.drizzle
        case 301, 311, 321:
            return WeatherIcon.rain
        case 302, 312, 314:
            return WeatherIcon.heavyRain
        case 500, 501, 520, 521:
            return WeatherIcon.rain
        case 502, 503, 504, 522, 531:
            return WeatherIcon.heavyRain
        case 511:
            return WeatherIcon.ice
        case 600...602:
            return WeatherIcon.snow
        case 611...622:
            return WeatherIcon.sleet
        case 701:
            return WeatherIcon.fog
        case 711, 762:
            return WeatherIcon.smoke
        case 721:
            return WeatherIcon.haze
        case 731, 751, 761:
            return WeatherIcon.dust
        case 741:
            return WeatherIcon.fog
        case 771:
            return WeatherIcon.heavyRain
        case 781:
            return WeatherIcon.tornado
        case 800:
            return isDaytime() ? WeatherIcon.sun : WeatherIcon.moonStars
        case 801...804:
            return WeatherIcon.cloud
        default:
            return WeatherIcon.placeholder
        }
    }
    
    private func isDaytime() -> Bool {
        return icon.contains("d") ? true : false
    }
}

extension WeatherDescriptionRaw {
    enum CodingKeys: String, CodingKey {
        case description = "main"
        case icon
        case id
    }
}
