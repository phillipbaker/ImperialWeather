//
//  CurrentWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/23/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    var weather: CurrentWeather
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        let layout = sizeClassIsCompact 
        ? AnyLayout(HStackLayout(spacing: 32))
        : AnyLayout(VStackLayout(spacing: 32))
        
        VStack(spacing: 32) {
            layout {
                VStack(alignment: sizeClassIsCompact ? .leading : .center, spacing: 4) {
                    Text(weather.location)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .opacity(0.9)
                    Text(weather.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: sizeClassIsCompact ? .leading : .center)
                
                IconAndTemperatureView(
                    icon: weather.icon,
                    celsius: weather.celsius,
                    fahrenheit: weather.fahrenheit
                )
            }
            .accessibilityElement(children: .combine)
            
            TemperatureScalePicker()
        }
        .padding(.top, 8)
        .paneBackground()
    }
    
    private var sizeClassIsCompact: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .compact
    }
}

#Preview {
    CurrentWeatherView(weather: .preview)
        .padding()
        .backgroundView()
}
