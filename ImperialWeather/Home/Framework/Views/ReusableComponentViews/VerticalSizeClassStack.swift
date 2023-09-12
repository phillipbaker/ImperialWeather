//
//  VerticalSizeClassStack.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/27/22.
//

import SwiftUI

struct VerticalSizeClassStack<Content: View>: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var spacing: CGFloat?
    var horizontalAlignment: HorizontalAlignment
    var verticalAlignment: VerticalAlignment
    var content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if verticalSizeClass == .compact {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            } else {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            }
        }
    }
}
