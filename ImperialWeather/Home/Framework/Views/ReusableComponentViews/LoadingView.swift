//
//  LoadingView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/12/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.weatherBackground
                .ignoresSafeArea()
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
