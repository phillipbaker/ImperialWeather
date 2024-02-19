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
                .mock_rain,
                .mock_snow,
                .mock_fog
            ])
        
        XCTAssertEqual(WeatherDescription.drizzle, description)
    }
    
    func test_mapFirstDescription_shouldMapInvalidRawWeatherDescriptionId_toNoDescriptionString() {
        let description = WeatherDescriptionRaw.mapFirstDescription(from: [.mock_invalidID])
        XCTAssertEqual(WeatherDescription.noDescription, description)
    }
    
    func test_mapFirstIcon_shouldMapFirstRawWeatherDescriptionId_toWeatherSymbolString() {
        let result = WeatherDescriptionRaw
            .mapFirstIcon(from: [
                .mock_fog,
                .mock_rain,
                .mock_drizzle
            ])
        
        XCTAssertEqual(WeatherSymbol.fog, result)
    }
    
    func test_mapFirstIcon_shouldMapInvalidRawWeatherDescriptionId_toPlaceholderSymbolString() {
        let placeholder = WeatherDescriptionRaw.mapFirstIcon(from: [.mock_invalidID])
        XCTAssertEqual(WeatherSymbol.placeholder, placeholder)
    }
    
    func test_mapIcon_shouldMapRawWeatherDescriptionId_toWeatherSymbolString() {
        let drizzle = WeatherDescriptionRaw.mock_drizzle.mapIcon()
        XCTAssertEqual(WeatherSymbol.drizzle, drizzle)
        
        let rain = WeatherDescriptionRaw.mock_rain.mapIcon()
        XCTAssertEqual(WeatherSymbol.rain, rain)
        
        let ice = WeatherDescriptionRaw.mock_ice.mapIcon()
        XCTAssertEqual(WeatherSymbol.ice, ice)
    }
    
    func test_mapIcon_shouldMapInvalidRawWeatherDescriptionId_toPlaceholderSymbolString() {
        let placeholder = WeatherDescriptionRaw.mock_invalidID.mapIcon()
        XCTAssertEqual(WeatherSymbol.placeholder, placeholder)
    }
    
    func test_mapIcon_shouldMapClearDayIconString_toClearDaySymbolString() {
        let day = WeatherDescriptionRaw.mock_clearDay.mapIcon()
        XCTAssertEqual(WeatherSymbol.sun, day)
    }
    
    func test_mapIcon_shouldMapClearNightIconString_toClearNightSymbolString() {
        let night = WeatherDescriptionRaw.mock_clearNight.mapIcon()
        XCTAssertEqual(WeatherSymbol.moonStars, night)
    }

    func test_mapDescription_shouldMapRawWeatherDescriptionId_toWeatherDescriptionString() {
        let thunderstorm = WeatherDescriptionRaw.mock_thunderstorm.mapDescription()
        XCTAssertEqual(WeatherDescription.thunderstorm, thunderstorm)
        
        let haze = WeatherDescriptionRaw.mock_haze.mapDescription()
        XCTAssertEqual(WeatherDescription.haze, haze)
        
        let tornado = WeatherDescriptionRaw.mock_tornado.mapDescription()
        XCTAssertEqual(WeatherDescription.tornado, tornado)
    }
    
    func test_mapDescription_shouldMapInvalidRawWeatherDescriptionId_toNoDescriptionString() {
        let description = WeatherDescriptionRaw.mock_invalidID.mapDescription()
        XCTAssertEqual(WeatherDescription.noDescription, description)
    }
}
