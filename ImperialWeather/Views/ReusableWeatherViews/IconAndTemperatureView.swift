//
//  IconAndTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 2/9/23.
//

import SwiftUI

struct IconAndTemperatureView: View {
    let icon: String
    let temperature: Double
    
    var body: some View {
        WeatherImage(systemName: icon)
            .font(.system(size: 48))
        
        Divider()
            .frame(maxHeight: 100)
        
        CurrentTemperatureView(temperature: temperature)
    }
}

struct IconAndTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        IconAndTemperatureView(
            icon: CurrentWeather.preview.icon,
            temperature: CurrentWeather.preview.temperature
        )
    }
}
