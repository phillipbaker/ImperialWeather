//
//  DailyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension Array where Element == DailyWeather {
    static let preview: [DailyWeather] = [
        .preview_today,
        .preview_tomorrow,
        .preview_inTwoDays,
        .preview_inThreeDays,
        .preview_inFourDays,
        .preview_inFiveDays,
        .preview_inSixDays,
        .preview_inSevenDays
    ]
}

extension DailyWeather {
    static let preview_today = DailyWeather(
        id: UUID(),
        day: .currentDateTime,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )
    
    static let preview_tomorrow = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 1, to: .currentDateTime)!,
        icon: WeatherSymbol.rain,
        celsius: Measurement(value: 25.0, unit: .celsius)
    )
    
    static let preview_inTwoDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 2, to: .currentDateTime)!,
        icon: WeatherSymbol.cloud,
        celsius: Measurement(value: 39.0, unit: .celsius)
    )
    
    static let preview_inThreeDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 3, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 26.0, unit: .celsius)
    )
    
    static let preview_inFourDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 4, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )
    
    static let preview_inFiveDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 5, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 24.0, unit: .celsius)
    )
    
    static let preview_inSixDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 6, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 27.0, unit: .celsius)
    )
    
    static let preview_inSevenDays = DailyWeather(
        id: UUID(),
        day: Calendar.current.date(byAdding: .day, value: 7, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 29.0, unit: .celsius)
    )
}
