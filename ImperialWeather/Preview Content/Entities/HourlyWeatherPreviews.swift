//
//  HourlyWeather+Preview.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/29/22.
//

import Foundation

extension Array where Element == HourlyWeather {
    static let preview: [HourlyWeather] = [
        .preview_currentHour,
        .preview_nextHour,
        .preview_inTwoHours,
        .preview_inThreeHours,
        .preview_inFourHours,
        .preview_inFiveHours,
        .preview_inSixHours,
        .preview_inSevenHours,
        .preview_inEightHours,
        .preview_inNineHours,
        .preview_inTenHours,
        .preview_inElevenHours,
        .preview_inTwelveHours
    ]
}

extension HourlyWeather {
    static let preview_currentHour = HourlyWeather(
        id: UUID(),
        hour: .currentDateTime,
        icon: WeatherSymbol.cloud,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )
    
    static let preview_nextHour =  HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 1, to: .currentDateTime)!,
        icon: WeatherSymbol.drizzle,
        celsius: Measurement(value: 24.0, unit: .celsius)
    )
    
    static let preview_inTwoHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 2, to: .currentDateTime)!,
        icon: WeatherSymbol.heavyRain,
        celsius: Measurement(value: 17.0, unit: .celsius)
    )
    
    static let preview_inThreeHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 3, to: .currentDateTime)!,
        icon: WeatherSymbol.rain,
        celsius: Measurement(value: 15.0, unit: .celsius)
    )
    
    static let preview_inFourHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 4, to: .currentDateTime)!,
        icon: WeatherSymbol.thunderstorm,
        celsius: Measurement(value: 16.0, unit: .celsius)
    )
    
    static let preview_inFiveHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 5, to: .currentDateTime)!,
        icon: WeatherSymbol.snow,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )
    
    static let preview_inSixHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 6, to: .currentDateTime)!,
        icon: WeatherSymbol.sun,
        celsius: Measurement(value: 26.0, unit: .celsius)
    )
    
    static let preview_inSevenHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 7, to: .currentDateTime)!,
        icon: WeatherSymbol.placeholder,
        celsius: Measurement(value: 21.0, unit: .celsius)
    )

    static let preview_inEightHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 8, to: .currentDateTime)!,
        icon: WeatherSymbol.dust,
        celsius: Measurement(value: 22.0, unit: .celsius)
    )
    
    static let preview_inNineHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 9, to: .currentDateTime)!,
        icon: WeatherSymbol.fog,
        celsius: Measurement(value: 34.0, unit: .celsius)
    )
    
    static let preview_inTenHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 10, to: .currentDateTime)!,
        icon: WeatherSymbol.haze,
        celsius: Measurement(value: 29.0, unit: .celsius)
    )
    
    static let preview_inElevenHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 11, to: .currentDateTime)!,
        icon: WeatherSymbol.ice,
        celsius: Measurement(value: 32.0, unit: .celsius)
    )
    
    static let preview_inTwelveHours = HourlyWeather(
        id: UUID(),
        hour: Calendar.current.date(byAdding: .hour, value: 12, to: .currentDateTime)!,
        icon: WeatherSymbol.moonStars,
        celsius: Measurement(value: 36.0, unit: .celsius)
    )
}
