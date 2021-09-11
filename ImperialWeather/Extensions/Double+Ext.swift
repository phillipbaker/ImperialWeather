//
//  Double+Ext.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 8/30/21.
//

import Foundation

extension Double {
    var celsiusString: String {
        return String(format: "%.0f", self)
    }

    var fahrenheitString: String {
        return String(format: "%.0f", (self * 1.8) + 32)
    }
}
