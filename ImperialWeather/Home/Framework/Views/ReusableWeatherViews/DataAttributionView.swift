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
            SizeCategoryStack(spacing: 4) {
                Text(WeatherLabel.source)
            }
        }
        .font(.caption)
        .textCase(.uppercase)
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DataAttributionView_Previews: PreviewProvider {
    static var previews: some View {
        DataAttributionView()
    }
}
