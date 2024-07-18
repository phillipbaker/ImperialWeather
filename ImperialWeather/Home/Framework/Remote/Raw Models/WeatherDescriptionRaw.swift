//
//  WeatherDescriptionRaw.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct WeatherDescriptionRaw: Decodable, Equatable {
    let icon: String
    let id: Int

    func mapIcon() -> String {
        switch id {
        case 200...232:
            return WeatherSymbol.thunderstorm.rawValue
        case 300, 310, 500, 520:
            return WeatherSymbol.drizzle.rawValue
        case 301, 311, 313, 321, 501, 521:
            return WeatherSymbol.rain.rawValue
        case 302, 312, 314, 502, 503, 504, 522, 531, 771:
            return WeatherSymbol.heavyRain.rawValue
        case 511:
            return WeatherSymbol.ice.rawValue
        case 600...602:
            return WeatherSymbol.snow.rawValue
        case 611...622:
            return WeatherSymbol.sleet.rawValue
        case 701, 741:
            return WeatherSymbol.fog.rawValue
        case 711, 762:
            return WeatherSymbol.smoke.rawValue
        case 721:
            return WeatherSymbol.haze.rawValue
        case 731, 751, 761:
            return WeatherSymbol.dust.rawValue
        case 781:
            return WeatherSymbol.tornado.rawValue
        case 800:
            return isDaytime() ? WeatherSymbol.clearDay.rawValue : WeatherSymbol.clearNight.rawValue
        case 801...804:
            return WeatherSymbol.cloud.rawValue
        default:
            return WeatherSymbol.invalidId.rawValue
        }
    }

    private func isDaytime() -> Bool {
        return icon.contains("d") ? true : false
    }

    static func mapFirstIcon(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.mapIcon() ?? WeatherSymbol.invalidId.rawValue
    }

    func mapDescription() -> String {
        switch id {
        case 200...232:
            return WeatherDescription.thunderstorm
        case 300, 310, 500, 520:
            return WeatherDescription.drizzle
        case 301, 311, 313, 321, 501, 521:
            return WeatherDescription.rain
        case 302, 312, 314, 502, 503, 504, 522, 531:
            return WeatherDescription.heavyRain
        case 511:
            return WeatherDescription.ice
        case 600...602:
            return WeatherDescription.snow
        case 611...622:
            return WeatherDescription.sleet
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
            return WeatherDescription.invalidId
        }
    }

    static func mapFirstDescription(from weatherDescriptionsRaw: [WeatherDescriptionRaw]) -> String {
        return weatherDescriptionsRaw.first?.mapDescription() ?? WeatherDescription.invalidId
    }
}
