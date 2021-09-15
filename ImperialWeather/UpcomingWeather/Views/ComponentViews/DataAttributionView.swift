//
//  DataAttributionView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 9/13/21.
//

import SwiftUI

struct DataAttributionView: View {
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Source:")
                Link("OpenWeatherMap", destination: URL(string: "https://openweathermap.org")!)
            }
            .font(.caption)
            .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct DataAttributionView_Previews: PreviewProvider {
    static var previews: some View {
        DataAttributionView()
    }
}
