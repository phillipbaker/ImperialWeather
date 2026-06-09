//
//  Formatting.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import Foundation

extension Date {
    func complete(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self.formatted(.dateTime.weekday(.wide).month(.wide).day(), timeZone: timeZone, locale: locale)
    }

    func monthAndDay(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self.formatted(.dateTime.month().day(), timeZone: timeZone, locale: locale)
    }

    func narrowHour(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self <= Date.now
            ? WeatherLabel.now
            : self.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated)), timeZone: timeZone, locale: locale)
    }

    func date(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self.formatted(.dateTime.day(), timeZone: timeZone, locale: locale)
    }

    func weekday(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self.formatted(.dateTime.weekday(), timeZone: timeZone, locale: locale)
    }

    func wideWeekday(timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = .autoupdatingCurrent) -> String {
        self.formatted(.dateTime.weekday(.wide), timeZone: timeZone, locale: locale)
    }

    private func formatted(_ style: Date.FormatStyle, timeZone: TimeZone, locale: Locale) -> String {
        var style = style
        style.timeZone = timeZone
        return self.formatted(style.locale(locale))
    }
}

extension Measurement<UnitTemperature> {
    var abbreviated: String {
        self.formatted(
            .measurement(
                width: .abbreviated,
                usage: .asProvided,
                numberFormatStyle: .number.precision(.fractionLength(0))
            )
        )
    }
}
