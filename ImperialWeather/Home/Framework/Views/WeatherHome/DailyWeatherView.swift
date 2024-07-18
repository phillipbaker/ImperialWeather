//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI
import SwiftUINavigation

struct DailyWeatherView: View {
    let dailyWeather: [DailyWeather]
    @State private var selection: DailyWeather?

    var body: some View {
        VStack(spacing: 12) {
            Label(WeatherLabel.sevenDayForecast, systemImage: "calendar")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .textCase(.uppercase)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)

            ForEach(dailyWeather) { day in
                HorizontalSeparator()

                Button {
                    selection = day
                } label: {
                    DailyWeatherRow(dailyWeather: day)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                }
                .tint(.primary)
                .sheet(unwrapping: self.$selection) { $selection in
                    WeatherDetailView(dailyWeather: dailyWeather, selection: $selection)
                }
            }
        }
        .paneBackground()
    }
}

#Preview {
    DailyWeatherView(dailyWeather: .preview)
        .padding(.horizontal)
        .backgroundView()
}
