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
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .paneShadow()
    }
}
