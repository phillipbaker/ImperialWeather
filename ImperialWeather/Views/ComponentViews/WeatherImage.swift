//
//  WeatherImage.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 11/30/22.
//

import SwiftUI

struct WeatherImage: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .imageScale(.large)
            .paneShadow()
    }
}
