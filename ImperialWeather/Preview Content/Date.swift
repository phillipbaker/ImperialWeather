//
//  Date.swift
//  ImperialWeatherTests
//
//  Created by Phillip Baker on 16/02/2024.
//

import Foundation

extension Date {
    static let currentDateTime = Date.now
    static let nextHour = Calendar.current.date(byAdding: .hour, value: 1, to: .currentDateTime)!
    static let inTwoHours = Calendar.current.date(byAdding: .hour, value: 2, to: .currentDateTime)!
    static let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: .currentDateTime)!
    static let inTwoDays = Calendar.current.date(byAdding: .day, value: 2, to: .currentDateTime)!
}
