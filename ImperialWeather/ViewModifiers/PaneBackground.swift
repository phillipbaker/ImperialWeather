//
//  PaneBackground.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/5/21.
//

import SwiftUI

struct PaneBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(UltraThinMaterialView())
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 1)
    }
}

extension View {
    func paneBackground() -> some View {
        self
            .modifier(PaneBackground())
    }
}
