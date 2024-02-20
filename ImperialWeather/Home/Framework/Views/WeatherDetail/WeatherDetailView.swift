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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    TemperatureScalePicker()
                    
                    CalendarWeekView(
                        dailyWeather: dailyWeather,
                        selection: $selection
                    )
                    .paneBackground()
                    
                    IconAndTemperatureView(
                        icon: selection.icon,
                        celsius: selection.celsius,
                        fahrenheit: selection.fahrenheit
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .paneBackground()
                    
                    VStack(spacing: 16) {
                        if #available(iOS 16.0, *) {
                            Text(WeatherLabel.dailyForecast)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.callout)
                                .textCase(.uppercase)
                                .foregroundColor(.secondary)
                            
                            TemperatureChartView(dailyWeather: dailyWeather)
                                .frame(minHeight: 320)
                        }
                    }
                    .padding(.bottom)
                    .paneBackground()
                    
                    DataAttributionView()
                        .padding(.leading)
                }
                .font(.system(.title2, design: .rounded))
                .padding()
            }
            .backgroundView()
            .navigationTitle(selection.day.complete)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(WeatherLabel.done) {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    WeatherDetailView(
        dailyWeather: .preview,
        selection: .constant(.preview_today)
    )
}
