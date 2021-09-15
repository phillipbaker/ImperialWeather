//
//  UltraThinMaterialView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/5/21.
//

import SwiftUI

struct UltraThinMaterialView: UIViewRepresentable {
    typealias UIViewType = UIVisualEffectView

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: .systemUltraThinMaterial)
    }
}
