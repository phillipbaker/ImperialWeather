//
//  CurrentTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 12/1/22.
//

import SwiftUI

struct CurrentTemperatureView: View {
    let temperature: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            PrimaryTemperatureView(temperature: temperature)
                .font(.largeTitle)
                .opacity(0.9)
            
            SecondaryTemperatureView(temperature: temperature)
        }
    }
}
