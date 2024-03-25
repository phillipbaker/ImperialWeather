//
//  DataAttributionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/13/21.
//

import SwiftUI

struct DataAttributionView: View {
    var body: some View {
        Link(destination: URL(string: "https://openweathermap.org")!) {
            Text(WeatherLabel.source)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.caption)
        .fontWeight(.medium)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    DataAttributionView()
}
