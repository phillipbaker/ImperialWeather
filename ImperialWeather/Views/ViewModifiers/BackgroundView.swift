//
//  View+backgroundView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

extension View {
    func backgroundView() -> some View {
        self
            .background(Color.weatherBackground.ignoresSafeArea())
    }
}
