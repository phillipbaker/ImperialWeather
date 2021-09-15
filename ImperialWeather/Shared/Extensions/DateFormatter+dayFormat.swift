//
//  DateFormatter+dayFormat.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/12/21.
//

import Foundation

extension DateFormatter {
    static let dayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}
