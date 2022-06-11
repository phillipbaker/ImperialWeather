//
//  WeatherImageView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/15/21.
//

import SwiftUI

struct WeatherImageView: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .imageScale(.large)
            .paneShadow()
    }
}
