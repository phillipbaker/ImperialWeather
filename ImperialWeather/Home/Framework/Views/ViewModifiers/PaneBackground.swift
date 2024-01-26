//
//  PaneShadow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/5/21.
//

import SwiftUI

struct PaneBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .paneShadow()
    }
}
extension View {
    func paneBackground() -> some View {
        modifier(PaneBackground())
    }
}
