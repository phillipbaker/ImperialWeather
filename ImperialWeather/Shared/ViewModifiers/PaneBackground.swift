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
            .paneShadow()
    }
}

extension View {
    func paneBackground() -> some View {
        self
            .modifier(PaneBackground())
    }
}
