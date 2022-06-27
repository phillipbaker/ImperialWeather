//
//  HorizontalSizeClassStack.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/1/21.
//

import SwiftUI

struct HorizontalSizeClassStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

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
            if horizontalSizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}
