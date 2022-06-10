//
//  PaneShadow.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/5/21.
//

import SwiftUI

extension View {
    func paneBackground() -> some View {
        self
            .padding()
            .background(UltraThinMaterialView())
            .cornerRadius(12)
            .paneShadow()
    }
}

extension View {
    func paneShadow() -> some View {
        self
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 1)
    }
}
