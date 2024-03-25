//
//  Formatting.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import Foundation

extension Date {
    var complete: String {
        self.formatted(.dateTime.weekday(.wide).month(.wide).day())
    }
    
    var monthAndDay: String {
        self.formatted(.dateTime.month().day())
    }
    
    var narrowHour: String {
        self <= Date.now ? WeatherLabel.now : self.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated)))
    }
    
    var date: String {
        self.formatted(.dateTime.day())
    }
    
    var weekday: String {
        self.formatted(.dateTime.weekday())
    }

    var wideWeekday: String {
        self.formatted(.dateTime.weekday(.wide))
    }
}

extension Measurement<UnitTemperature> {
    var formatted: String {
        self.formatted(.measurement(
            width: .abbreviated,
            usage: .asProvided,
            numberFormatStyle: .number.precision(.fractionLength(0))
        ))
    }
}
