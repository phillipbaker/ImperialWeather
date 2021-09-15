//
//  TemperatureScale.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import Foundation

enum TemperatureScale: Int {
    case celsius
    case fahrenheit

    var id: Int { rawValue }
}
