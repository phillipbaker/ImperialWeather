//
//  DailyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension Array where Element == DailyWeather {
    static let preview: [DailyWeather] = [
        .tomorrowPreview,
        .inTwoDaysPreview,
        .inThreeDaysPreview,
        .inFourDaysPreview,
        .inFiveDaysPreview,
        .inSixDaysPreview,
        .inSevenDaysPreview
    ]
}

extension DailyWeather {
    static let todayPreview = DailyWeather(
        id: UUID(),
        day: .currentDateTime,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )

    static let tomorrowPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 1, to: .currentDateTime)!,
        icon: WeatherSymbol.rain.rawValue,
        celsius: Measurement(value: 25.0, unit: .celsius)
    )

    static let inTwoDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 2, to: .currentDateTime)!,
        icon: WeatherSymbol.cloud.rawValue,
        celsius: Measurement(value: 39.0, unit: .celsius)
    )

    static let inThreeDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 3, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 26.0, unit: .celsius)
    )

    static let inFourDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 4, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )

    static let inFiveDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 5, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 24.0, unit: .celsius)
    )

    static let inSixDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 6, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 27.0, unit: .celsius)
    )

    static let inSevenDaysPreview = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 7, to: .currentDateTime)!,
        icon: WeatherSymbol.clearDay.rawValue,
        celsius: Measurement(value: 29.0, unit: .celsius)
    )
}
