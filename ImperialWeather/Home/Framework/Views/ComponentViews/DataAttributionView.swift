//
//  DataAttributionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/13/21.
//

import SwiftUI

struct DataAttributionView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var body: some View {
        Link(destination: URL(string: "https://openweathermap.org")!) {
            Text(WeatherLabel.source)
        }
        .font(.caption)
//        .textCase(.uppercase)
//        .fontWeight(.medium)
        .foregroundStyle(.secondary)
        .frame( maxWidth: .infinity, alignment: dynamicTypeSize.isAccessibilitySize ? .center : .leading)
    }
}

#Preview {
    DataAttributionView()
}
