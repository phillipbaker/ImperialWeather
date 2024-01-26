//
//  View+backgroundView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct BackgroundView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.weatherBackground.ignoresSafeArea())
    }
}

extension View {
    func backgroundView() -> some View {
        modifier(BackgroundView())
    }
}
