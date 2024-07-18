//
//  HourlyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension Array where Element == HourlyWeather {
    static let preview: [HourlyWeather] = [
        .currentHourPreview,
        .nextHourPreview,
        .inTwoHoursPreview,
        .inThreeHoursPreview,
        .inFourHoursPreview,
        .inFiveHoursPreview,
        .inSixHoursPreview,
        .inSevenHoursPreview,
        .inEightHoursPreview,
        .inNineHoursPreview,
        .inTenHoursPreview,
        .inElevenHoursPreview,
        .inTwelveHoursPreview
    ]
}

extension HourlyWeather {
    static let currentHourPreview = HourlyWeather(
        id: UUID(),
        hour: .currentDateTime,
        icon: WeatherSymbol.cloud.rawValue,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )

    static let nextHourPreview =  HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 1, to: .currentDateTime)!,
        icon: WeatherSymbol.drizzle.rawValue,
        celsius: Measurement(value: 24.0, unit: .celsius)
    )

    static let inTwoHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 2, to: .currentDateTime)!,
        icon: WeatherSymbol.heavyRain.rawValue,
        celsius: Measurement(value: 17.0, unit: .celsius)
    )

    static let inThreeHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 3, to: .currentDateTime)!,
        icon: WeatherSymbol.rain.rawValue,
        celsius: Measurement(value: 15.0, unit: .celsius)
    )

    static let inFourHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 4, to: .currentDateTime)!,
        icon: WeatherSymbol.thunderstorm.rawValue,
        celsius: Measurement(value: 16.0, unit: .celsius)
    )

    static let inFiveHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 5, to: .currentDateTime)!,
        icon: WeatherSymbol.snow.rawValue,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )

    static let inSixHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 6, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 26.0, unit: .celsius)
    )

    static let inSevenHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 7, to: .currentDateTime)!,
        icon: WeatherSymbol.invalidId.rawValue,
        celsius: Measurement(value: 21.0, unit: .celsius)
    )

    static let inEightHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 8, to: .currentDateTime)!,
        icon: WeatherSymbol.dust.rawValue,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )

    static let inNineHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 9, to: .currentDateTime)!,
        icon: WeatherSymbol.fog.rawValue,
        celsius: Measurement(value: 34.0, unit: .celsius)
    )

    static let inTenHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 10, to: .currentDateTime)!,
        icon: WeatherSymbol.haze.rawValue,
        celsius: Measurement(value: 29.0, unit: .celsius)
    )

    static let inElevenHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 11, to: .currentDateTime)!,
        icon: WeatherSymbol.ice.rawValue,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )

    static let inTwelveHoursPreview = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 12, to: .currentDateTime)!,
        icon: WeatherSymbol.clearNight.rawValue,
        celsius: Measurement(value: 36.0, unit: .celsius)
    )
}
