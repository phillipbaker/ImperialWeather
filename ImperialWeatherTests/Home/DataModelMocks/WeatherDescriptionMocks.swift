//
//  WeatherDescriptionRawFakes.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 07/02/2024.
//

import Foundation
@testable import ImperialWeather

extension WeatherDescriptionRaw {
    static let iconMocks: [WeatherDescriptionRaw] = [
        .clearDayMock,
        .clearNightMock,
        .cloudMock,
        .drizzleMock,
        .dustMock,
        .fogMock,
        .hazeMock,
        .heavyRainMock,
        .iceMock,
        .invalidIdMock,
        .rainMock,
        .sleetMock,
        .smokeMock,
        .snowMock,
        .thunderstormMock,
        .tornadoMock
    ]

    static let descriptionMocks: [WeatherDescriptionRaw] = [
        .ashMock,
        .clearDayMock,
        .cloudMock,
        .drizzleMock,
        .dustMock,
        .fogMock,
        .hazeMock,
        .heavyRainMock,
        .iceMock,
        .invalidIdMock,
        .mistMock,
        .rainMock,
        .sandMock,
        .sleetMock,
        .smokeMock,
        .snowMock,
        .squallMock,
        .thunderstormMock,
        .tornadoMock
    ]

    static let ashMock = WeatherDescriptionRaw(icon: "50d", id: 762)
    static let cloudMock = WeatherDescriptionRaw(icon: "02d", id: Int.random(in: 801...804))
    static let drizzleMock = WeatherDescriptionRaw(icon: "09n", id: [300, 310, 500, 520].randomElement()!)
    static let dustMock = WeatherDescriptionRaw(icon: "50d", id: [731, 761].randomElement()!)
    static let fogMock = WeatherDescriptionRaw(icon: "50d", id: 741)
    static let hazeMock = WeatherDescriptionRaw(icon: "50d", id: 721)
    static let heavyRainMock = WeatherDescriptionRaw(
        icon: "09d",
        id: [302, 312, 314, 502, 503, 504, 522, 531].randomElement()!
    )
    static let iceMock = WeatherDescriptionRaw(icon: "13d", id: 511)
    static let mistMock = WeatherDescriptionRaw(icon: "50d", id: 701)
    static let clearNightMock = WeatherDescriptionRaw(icon: "01n", id: 800)
    static let invalidIdMock = WeatherDescriptionRaw(icon: "04n", id: 100)
    static let rainMock = WeatherDescriptionRaw(icon: "10d", id: [301, 311, 313, 321, 501, 521].randomElement()!)
    static let sandMock = WeatherDescriptionRaw(icon: "50d", id: 751)
    static let sleetMock = WeatherDescriptionRaw(icon: "13d", id: Int.random(in: 611...622))
    static let smokeMock = WeatherDescriptionRaw(icon: "50d", id: 711)
    static let snowMock = WeatherDescriptionRaw(icon: "13d", id: Int.random(in: 600...602))
    static let squallMock = WeatherDescriptionRaw(icon: "50d", id: 771)
    static let clearDayMock = WeatherDescriptionRaw(icon: "01d", id: 800)
    static let thunderstormMock = WeatherDescriptionRaw(icon: "11d", id: Int.random(in: 200...232))
    static let tornadoMock = WeatherDescriptionRaw(icon: "50d", id: 781)
}

extension WeatherSymbol {
    static let allValues: [String] = allCases.map { $0.rawValue }
}

extension WeatherDescription {
    static let mocks: [String] = [
        WeatherDescription.ash,
        WeatherDescription.clear,
        WeatherDescription.cloud,
        WeatherDescription.drizzle,
        WeatherDescription.dust,
        WeatherDescription.fog,
        WeatherDescription.haze,
        WeatherDescription.heavyRain,
        WeatherDescription.ice,
        WeatherDescription.invalidId,
        WeatherDescription.mist,
        WeatherDescription.rain,
        WeatherDescription.sand,
        WeatherDescription.sleet,
        WeatherDescription.smoke,
        WeatherDescription.snow,
        WeatherDescription.squall,
        WeatherDescription.thunderstorm,
        WeatherDescription.tornado
    ]
}
