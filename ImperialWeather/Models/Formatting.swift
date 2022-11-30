//
//  Formatting.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import Foundation

extension Date {
    var narrowHour: String {
        self <= Date.now ? "Now" : self.formatted(.dateTime.hour())
    }

    var wideWeekday: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var narrowWeekday: String {
        self.formatted(.dateTime.weekday(.narrow))
    }
}

extension Double {
    var fahrenheitString: String {
        ((self * 1.8) + 32).formatted(.number.precision(.significantDigits(2)))
    }

    var celsiusString: String {
        self.formatted(.number.precision(.significantDigits(1)))
    }
}
