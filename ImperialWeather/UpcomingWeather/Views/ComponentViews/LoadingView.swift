//
//  LoadingView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 7/8/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .overlay(ProgressView())
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            LoadingView()
        }
    }
}
