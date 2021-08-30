//
//  IdleView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 8/13/21.
//

import SwiftUI

struct IdleView: View {
    var body: some View {
        Color.weatherBackground
            .edgesIgnoringSafeArea(.all)
    }
}

struct IdleView_Previews: PreviewProvider {
    static var previews: some View {
        IdleView()
    }
}
