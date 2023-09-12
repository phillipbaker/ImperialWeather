//
//  IconAndTemperatureView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 2/9/23.
//

import SwiftUI

struct IconAndTemperatureView: View {
    let icon: String
    let celsius: Measurement<UnitTemperature>
    let fahrenheit: Measurement<UnitTemperature>
    
    var body: some View {
        HStack {
            WeatherImage(systemName: icon)
                .font(.system(size: 48))
            
            Divider()
                .frame(maxHeight: 100)
            
            CurrentTemperatureView(celsius: celsius, fahrenheit: fahrenheit)
        }
    }
}

struct IconAndTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        IconAndTemperatureView(
            icon: CurrentWeather.preview.icon,
            celsius: CurrentWeather.preview.celsius,
            fahrenheit: CurrentWeather.preview.fahrenheit
        )
    }
}
