//
//  Double+Ext.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 8/30/21.
//

import Foundation

extension Double {
    var celsiusStringShort: String {
        return String(format: "%.0f", self) + Degrees.c
    }

    var celsiusString: String {
        return String(format: "%.0f", self) + Degrees.celsius
    }
}
