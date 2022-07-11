//
//  Formatting.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import Foundation

extension Date {
    var formattedHour: String {
        let currentTime = Date.now
        
        if self <= currentTime {
            return "Now"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "ha"
            return formatter.string(from: self)
        }
    }

    var formattedDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
}

extension Double {
    var fahrenheitString: String {
        return String(format: "%.0f", (self * 1.8) + 32)
    }

    var celsiusString: String {
        return String(format: "%.0f", self)
    }
}
