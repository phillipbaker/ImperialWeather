//
//  PaneShadow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/5/21.
//

import SwiftUI

struct PaneBackground: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .background(Color.materialTint(for: colorScheme))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .paneShadow()
    }
}
extension View {
    func paneBackground() -> some View {
        modifier(PaneBackground())
    }
}
