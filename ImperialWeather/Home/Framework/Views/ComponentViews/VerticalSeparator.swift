//
//  VerticalSeparator.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 3/16/24.
//

import SwiftUI

struct VerticalSeparator: View {
    var body: some View {
        Rectangle()
            .frame(width: 1)
            .opacity(0.1)
    }
}

#Preview {
    VerticalSeparator()
}
