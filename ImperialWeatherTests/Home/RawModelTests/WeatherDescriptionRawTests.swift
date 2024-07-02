//
//  WeatherDescriptionRawTests.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

@testable import ImperialWeather
import Testing

@Suite(.tags(.rawModels, .dataMapping))
struct WeatherDescriptionRawTests {
    @Test(arguments: zip(WeatherDescriptionRaw.iconMocks, WeatherSymbol.allValues))
    func map(weatherDescriptionRaw: WeatherDescriptionRaw, toIconString icon: String) {
        #expect(weatherDescriptionRaw.mapIcon() == icon)
    }
    
    @Test("") func mapFirstIdToIcon() {
        let firstIcon = WeatherDescriptionRaw.mapFirstIcon(from: WeatherDescriptionRaw.iconMocks)
        #expect(firstIcon == WeatherSymbol.clearDay.rawValue)
    }
    
    @Test func mapInvalidFirstIdToPlaceholderIcon() {
        let invalidFirstId = WeatherDescriptionRaw.mapFirstIcon(from: [])
        #expect(invalidFirstId == WeatherSymbol.invalidId.rawValue)
    }
    
    @Test(arguments: zip(WeatherDescriptionRaw.descriptionMocks, WeatherDescription.mocks))
    func map(rawDescription: WeatherDescriptionRaw, toDescription description: String) {
        #expect(rawDescription.mapDescription() == description)
    }
    
    @Test func mapFirstIdToDescription() {
        let firstDescription = WeatherDescriptionRaw.mapFirstDescription(from: WeatherDescriptionRaw.descriptionMocks)
        #expect(firstDescription == WeatherDescription.ash)
    }
    
    @Test func mapInvalidFirstIdToPlaceholderDescription() {
        let invalidFirstId = WeatherDescriptionRaw.mapFirstDescription(from: [])
        #expect(invalidFirstId == WeatherDescription.invalidId)
    }
}
