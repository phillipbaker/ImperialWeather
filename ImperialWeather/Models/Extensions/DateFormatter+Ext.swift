//
//  DateFormatter+Ext.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import Foundation

extension DateFormatter {
    static let hourFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter
    }()
    
    static let dayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}
