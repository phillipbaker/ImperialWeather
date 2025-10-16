//
//  WeatherDetailView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/4/22.
//

import SwiftUI

struct WeatherDetailView: View {
    let dailyWeather: [DailyWeather]
    @Binding var selection: DailyWeather
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    CalendarWeekView(
                        dailyWeather: dailyWeather,
                        selection: $selection
                    )
                    .paneBackground()

                    VStack(spacing: 16) {
                        IconAndTemperatureView(
                            icon: selection.icon,
                            celsius: selection.celsius,
                            fahrenheit: selection.fahrenheit
                        )
                        .frame(minHeight: 100)

                        TemperatureScalePicker()
                    }
                    .frame(maxWidth: .infinity)
                    .paneBackground()

                    VStack(spacing: 16) {
                        Label(WeatherLabel.dailyForecast, systemImage: "calendar")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .textCase(.uppercase)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)

                        TemperatureChartView(dailyWeather: dailyWeather)
                            .frame(minHeight: 320)
                    }
                    .paneBackground()

                    DataAttributionView()
                        .padding(.horizontal)
                }
                .font(.title2)
                .padding()
            }
            .backgroundView()
            .navigationTitle(selection.day.complete)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if #available(iOS 26.0, *) {
                        Button(role: .close) {
                            self.dismiss()
                        }
                    } else {
                        // Fallback on earlier versions
                        Button(WeatherLabel.done) {
                            self.dismiss()
                        }
                    }
                }
            }
            .toolbarBackground(.classicBackground, for: .navigationBar)
        }
    }
}

#Preview {
    WeatherDetailView(
        dailyWeather: .preview,
        selection: .constant(.todayPreview)
    )
}
