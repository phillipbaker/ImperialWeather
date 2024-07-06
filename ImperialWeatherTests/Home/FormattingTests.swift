//
//  FormattingTests.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 06/07/2024.
//

import Foundation
@testable import ImperialWeather
import Testing

struct FormattingTests {
    @Test func complete() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.complete == "Saturday, July 6")
    }
    
    @Test func monthAndDay() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.monthAndDay == "Jul 6")
    }
    
    @Test func narrowHourCurrent() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.narrowHour == "Now")
    }
    
    @Test func narrowHourFuture() {
        let date = Date(timeIntervalSince1970: 1820279972)
        #expect(date.narrowHour == "2 AM")
    }
    
    @Test func date() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.date == "6")
    }
    
    @Test func weekday() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.weekday == "Sat")
    }
    
    @Test func wideWeekday() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.wideWeekday == "Saturday")
    }
    
    @Test func abbreviatedMeasurement() {
        let measurement = Measurement<UnitTemperature>(value: 23.0, unit: .celsius)
        #expect(measurement.abbreviated == "23°C")
    }
}
