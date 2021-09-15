
//
//  WeatherDescription.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/18/21.
//

import Foundation

struct WeatherDescription: Codable {
    let description: String
    let icon: String
    let id: Int

    var conditionName: String {
        switch id {
        case 200...210, 212...232:
            return WeatherIcons.thunderstorm
        case 211:
            return WeatherIcons.lightning
        case 300, 310, 313:
            return WeatherIcons.drizzle
        case 301, 311, 321:
            return WeatherIcons.rain
        case 302, 312, 314:
            return WeatherIcons.heavyRain
        case 500, 501, 520, 521:
            return WeatherIcons.rain
        case 502, 503, 504, 522, 531:
            return WeatherIcons.heavyRain
        case 511:
            return WeatherIcons.ice
        case 600...602:
            return WeatherIcons.snow
        case 611...622:
            return WeatherIcons.sleet
        case 701:
            return WeatherIcons.fog
        case 711, 762:
            return WeatherIcons.smoke
        case 721:
            return WeatherIcons.haze
        case 731, 751, 761:
            return WeatherIcons.dust
        case 741:
            return WeatherIcons.fog
        case 771:
            return WeatherIcons.heavyRain
        case 781:
            return WeatherIcons.tornado
        case 800:
            if icon.contains("d") {
                return WeatherIcons.sun
            } else {
                return WeatherIcons.moonStars
            }
        case 801...804:
            return WeatherIcons.cloud
        default:
            return WeatherIcons.dashedSquare
        }
    }
}

extension WeatherDescription {
    enum CodingKeys: String, CodingKey {
        case description = "main"
        case icon
        case id
    }
}
