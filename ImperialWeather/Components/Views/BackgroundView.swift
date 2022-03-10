//
//  BackgroundView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/14/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.weatherBackground
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
