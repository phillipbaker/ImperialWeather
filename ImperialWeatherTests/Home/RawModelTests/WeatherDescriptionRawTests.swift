//
//  WeatherDescriptionRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import XCTest

final class WeatherDescriptionRawTests: XCTestCase {
    
    func test_mapFirstDescription_shouldMapFirstRawWeatherDescriptionId_toWeatherDescriptionString() {
        let description = WeatherDescriptionRaw
            .mapFirstDescription(from:  [
                weatherDescriptionRawRain,
                weatherDescriptionRawSnow,
                weatherDescriptionRawFog
            ])
        
        XCTAssertEqual(WeatherDescription.drizzle, description)
    }
    
    func test_mapFirstDescription_shouldMapInvalidRawWeatherDescriptionId_toNoDescriptionString() {
        let description = WeatherDescriptionRaw.mapFirstDescription(from: [weatherDescriptionRawInvalidId])
        XCTAssertEqual(WeatherDescription.noDescription, description)
    }
    
    func test_mapFirstIcon_shouldMapFirstRawWeatherDescriptionId_toWeatherSymbolString() {
        let result = WeatherDescriptionRaw
            .mapFirstIcon(from: [
                weatherDescriptionRawFog,
                weatherDescriptionRawRain,
                weatherDescriptionRawDrizzle
            ])
        
        XCTAssertEqual(WeatherSymbol.fog, result)
    }
    
    func test_mapFirstIcon_shouldMapInvalidRawWeatherDescriptionId_toPlaceholderSymbolString() {
        let placeholder = WeatherDescriptionRaw.mapFirstIcon(from: [weatherDescriptionRawInvalidId])
        XCTAssertEqual(WeatherSymbol.placeholder, placeholder)
    }
    
    func test_mapIcon_shouldMapRawWeatherDescriptionId_toWeatherSymbolString() {
        let drizzle = weatherDescriptionRawDrizzle.mapIcon()
        XCTAssertEqual(WeatherSymbol.drizzle, drizzle)
        
        let rain = weatherDescriptionRawRain.mapIcon()
        XCTAssertEqual(WeatherSymbol.rain, rain)
        
        let ice = weatherDescriptionRawIce.mapIcon()
        XCTAssertEqual(WeatherSymbol.ice, ice)
    }
    
    func test_mapIcon_shouldMapInvalidRawWeatherDescriptionId_toPlaceholderSymbolString() {
        let placeholder = weatherDescriptionRawInvalidId.mapIcon()
        XCTAssertEqual(WeatherSymbol.placeholder, placeholder)
    }
    
    func test_mapIcon_shouldMapClearDayIconString_toClearDaySymbolString() {
        let day = weatherDescriptionRawClearDay.mapIcon()
        XCTAssertEqual(WeatherSymbol.sun, day)
    }
    
    func test_mapIcon_shouldMapClearNightIconString_toClearNightSymbolString() {
        let night = weatherDescriptionRawClearNight.mapIcon()
        XCTAssertEqual(WeatherSymbol.moonStars, night)
    }

    func test_mapDescription_shouldMapRawWeatherDescriptionId_toWeatherDescriptionString() {
        let thunderstorm = weatherDescriptionRawThunderstorm.mapDescription()
        XCTAssertEqual(WeatherDescription.thunderstorm, thunderstorm)
        
        let haze = weatherDescriptionRawHaze.mapDescription()
        XCTAssertEqual(WeatherDescription.haze, haze)
        
        let tornado = weatherDescriptionRawTornado.mapDescription()
        XCTAssertEqual(WeatherDescription.tornado, tornado)
    }
    
    func test_mapDescription_shouldMapInvalidRawWeatherDescriptionId_toNoDescriptionString() {
        let description = weatherDescriptionRawInvalidId.mapDescription()
        XCTAssertEqual(WeatherDescription.noDescription, description)
    }
}
