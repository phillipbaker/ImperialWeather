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
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .paneShadow()
    }
}
extension View {
    func paneBackground() -> some View {
        modifier(PaneBackground())
    }
}
