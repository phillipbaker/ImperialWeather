//
//  HorizontalSeparator.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 3/16/24.
//

import SwiftUI

struct HorizontalSeparator: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .opacity(0.1)
    }
}

#Preview {
    HorizontalSeparator()
}
