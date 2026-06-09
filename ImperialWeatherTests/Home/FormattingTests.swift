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
    // Pin a fixed time zone and locale so date formatting is deterministic
    // regardless of the machine (or CI runner) the tests run on.
    static let timeZone = TimeZone(identifier: "UTC")!
    static let locale = Locale(identifier: "en_US")

    @Test func complete() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.complete(timeZone: Self.timeZone, locale: Self.locale) == "Saturday, July 6")
    }

    @Test func monthAndDay() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.monthAndDay(timeZone: Self.timeZone, locale: Self.locale) == "Jul 6")
    }

    @Test func narrowHourCurrent() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.narrowHour(timeZone: Self.timeZone, locale: Self.locale) == "Now")
    }

    @Test func narrowHourFuture() {
        // 1820279972 is 2027-09-07 01:19 UTC.
        let date = Date(timeIntervalSince1970: 1820279972)
        #expect(date.narrowHour(timeZone: Self.timeZone, locale: Self.locale) == "1 AM")
    }

    @Test func date() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.date(timeZone: Self.timeZone, locale: Self.locale) == "6")
    }

    @Test func weekday() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.weekday(timeZone: Self.timeZone, locale: Self.locale) == "Sat")
    }

    @Test func wideWeekday() {
        let date = Date(timeIntervalSince1970: 1720279972)
        #expect(date.wideWeekday(timeZone: Self.timeZone, locale: Self.locale) == "Saturday")
    }

    @Test func abbreviatedMeasurement() {
        let measurement = Measurement<UnitTemperature>(value: 23.0, unit: .celsius)
        #expect(measurement.abbreviated == "23°C")
    }
}
