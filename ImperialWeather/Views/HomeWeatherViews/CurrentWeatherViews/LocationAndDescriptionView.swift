//
//  LocationAndDescriptionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import SwiftUI

struct LocationAndDescriptionView: View {
    let weather: CurrentWeather
    
    var body: some View {
        VStack(spacing: 4) {
            Text(weather.location)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
            Text(weather.description)
        }
        .opacity(0.9)
    }
}
