//
//  WeatherDescriptionStrings.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 5/23/23.
//

import Foundation

enum WeatherDescription {
    static let noDescription = NSLocalizedString(
        "No Description",
        tableName: "WeatherDescription",
        comment: "Label displayed when the weather description is missing from a forecast."
    )

    static let ash = NSLocalizedString(
        "Ash",
        tableName: "WeatherDescription",
        comment: "Label to describe volcanic ash."
    )
    
    static let clear = NSLocalizedString(
        "Clear",
        tableName: "WeatherDescription",
        comment: "Label to describe a clear sky without many clouds."
    )
    
    static let cloud = NSLocalizedString(
        "Cloud",
        tableName: "WeatherDescription",
        comment: "Label to describe cloudy conditions."
    )
    
    static let drizzle = NSLocalizedString(
        "Drizzle",
        tableName: "WeatherDescription",
        comment: "Label to describe light rainfall."
    )
    
    static let dust = NSLocalizedString(
        "Dust",
        tableName: "WeatherDescription",
        comment: "Label to describe sand/dust whirls."
    )
    
    static let fog = NSLocalizedString(
        "Fog",
        tableName: "WeatherDescription",
        comment: "Label to describe foggy conditions."
    )
    
    static let haze = NSLocalizedString(
        "Haze",
        tableName: "WeatherDescription",
        comment: "Label to describe hazy conditions."
    )
    
    static let mist = NSLocalizedString(
        "Mist",
        tableName: "WeatherDescription",
        comment: "Label to describe misty conditions."
    )
    
    static let rain = NSLocalizedString(
        "Rain",
        tableName: "WeatherDescription",
        comment: "Label to describe rainy conditions."
    )
    
    static let sand = NSLocalizedString(
        "Sand",
        tableName: "WeatherDescription",
        comment: "Label to describe sand or dust whirls or a sand or dust storm."
    )
    
    static let smoke = NSLocalizedString(
        "Smoke",
        tableName: "WeatherDescription",
        comment: "Label to describe smoke as it pertains to the weather."
    )
    
    static let snow = NSLocalizedString(
        "Snow",
        tableName: "WeatherDescription",
        comment: "Label to describe snowfall."
    )
    
    static let squall = NSLocalizedString(
        "Squall",
        tableName: "WeatherDescription",
        comment: "Label to describe ocean or coastal squalls."
    )
    
    static let thunderstorm = NSLocalizedString(
        "Thunderstorm",
        tableName: "WeatherDescription",
        comment: "Label to describe a thunderstorm."
    )
    
    static let tornado = NSLocalizedString(
        "Tornado",
        tableName: "WeatherDescription",
        comment: "Label to describe a tornado."
    )
}
