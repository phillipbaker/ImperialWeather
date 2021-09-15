//
//  AccessibilityLabel.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct AccessibilityLabel: ViewModifier {
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    let temperature: Double

    func body(content: Content) -> some View {
        content
            .accessibility(
                label: Text(temperatureScale == .celsius
                    ? temperature.celsiusString
                    : temperature.fahrenheitString
                )
            )
    }
}

extension View {
    func accessibilityLabel() -> some View {
        modifier(AccessibilityLabel(temperature: 21.0))
    }
}
