
//
//  WeatherDescriptionRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct WeatherDescriptionRaw: Codable {
    let icon: String
    let id: Int
    
    static func mapFirstDescription(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.mapDescription() ?? WeatherDescription.noDescription
    }
    
    static func mapFirstIcon(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.mapIcon() ?? WeatherSymbol.placeholder
    }
    
    func mapIcon() -> String {
        switch id {
        case 200...210, 212...232:
            return WeatherSymbol.thunderstorm
        case 211:
            return WeatherSymbol.lightning
        case 300, 310, 313:
            return WeatherSymbol.drizzle
        case 301, 311, 321:
            return WeatherSymbol.rain
        case 302, 312, 314:
            return WeatherSymbol.heavyRain
        case 500, 501, 520, 521:
            return WeatherSymbol.rain
        case 502, 503, 504, 522, 531:
            return WeatherSymbol.heavyRain
        case 511:
            return WeatherSymbol.ice
        case 600...602:
            return WeatherSymbol.snow
        case 611...622:
            return WeatherSymbol.sleet
        case 701:
            return WeatherSymbol.fog
        case 711, 762:
            return WeatherSymbol.smoke
        case 721:
            return WeatherSymbol.haze
        case 731, 751, 761:
            return WeatherSymbol.dust
        case 741:
            return WeatherSymbol.fog
        case 771:
            return WeatherSymbol.heavyRain
        case 781:
            return WeatherSymbol.tornado
        case 800:
            return isDaytime() ? WeatherSymbol.sun : WeatherSymbol.moonStars
        case 801...804:
            return WeatherSymbol.cloud
        default:
            return WeatherSymbol.placeholder
        }
    }
    
    func mapDescription() -> String {
        switch id {
        case 200...232:
            return WeatherDescription.thunderstorm
        case 300...321:
            return WeatherDescription.drizzle
        case 500...531:
            return WeatherDescription.rain
        case 600...622:
            return WeatherDescription.snow
        case 701:
            return WeatherDescription.mist
        case 711:
            return WeatherDescription.smoke
        case 721:
            return WeatherDescription.haze
        case 731, 761:
            return WeatherDescription.dust
        case 741:
            return WeatherDescription.fog
        case 751:
            return WeatherDescription.sand
        case 762:
            return WeatherDescription.ash
        case 771:
            return WeatherDescription.squall
        case 781:
            return WeatherDescription.tornado
        case 800:
            return WeatherDescription.clear
        case 801...804:
            return WeatherDescription.cloud
        default:
            return WeatherDescription.noDescription
        }
    }
    
    private func isDaytime() -> Bool {
        return icon.contains("d") ? true : false
    }
}

extension WeatherDescriptionRaw {
    enum CodingKeys: String, CodingKey {
        case icon
        case id
    }
}
