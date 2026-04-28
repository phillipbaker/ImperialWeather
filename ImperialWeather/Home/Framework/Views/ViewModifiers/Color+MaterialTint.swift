//
//  Color+MaterialTint.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 28/04/2026.
//

import SwiftUI

extension Color {
    static func materialTint(for scheme: ColorScheme) -> Color {
        switch scheme {
        case .dark:
            return Color(red: 0.2, green: 0.35, blue: 0.6).opacity(0.35)
        default:
            return .white.opacity(0.03)
        }
    }
}
