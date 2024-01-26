//
//  PaneShadow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/11/22.
//

import SwiftUI

struct PaneShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 1)
    }
}

extension View {
    func paneShadow() -> some View {
        modifier(PaneShadow())
    }
}
