//
//  WeatherDetailView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/4/22.
//

import Charts
import SwiftUI

struct WeatherDetailView: View {
    let dailyWeather: [DailyWeather]
    @Binding var selection: DailyWeather
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ScrollViewReader { value in
                    VStack(spacing: 20) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(dailyWeather) { dailyWeather in
                                    Button {
                                        selection = dailyWeather
                                    } label: {
                                        VStack(spacing: 8) {
                                            Text(dailyWeather.day.weekday)
                                                .textCase(.uppercase)
                                                .foregroundColor(.secondary)
                                            ZStack {
                                                Circle()
                                                    .opacity(dailyWeather == selection ? 1 : 0)
                                                    .foregroundColor(Color.selectionBackground)
                                                Text(dailyWeather.day.date)
                                                    .accessibilityLabel(dailyWeather.day.monthAndDay)
                                                    .foregroundColor(dailyWeather == selection ? .white : nil)
                                            }
                                            .frame(minWidth: 40, minHeight: 40)
                                        }
                                        .tint(.primary)
                                        .font(.callout)
                                    }
                                    
                                    Divider()
                                }
                            }
                            .accessibilityLabel("Detailed Daily Forecast Picker")
                        }
                        .paneBackground()
                        
                        HStack(spacing: 16) {
                            IconAndTemperatureView(
                                icon: selection.icon,
                                celsius: selection.celsius,
                                fahrenheit: selection.fahrenheit
                            )
                            
                            Spacer()
                            
                            VStack {
                                Spacer()
                                TemperatureScalePicker()
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .paneBackground()
                        
                        
                        VStack(spacing: 16) {
                            if #available(iOS 16.0, *) {
                                Text(WeatherLabel.dailyForecast)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.callout)
                                    .textCase(.uppercase)
                                    .foregroundColor(.secondary)
                                
                                WeatherDetailChartView(dailyWeather: dailyWeather)
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
                    .onAppear {
                        value.scrollTo(selection.id)
                    }
                }
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

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(
            dailyWeather: DailyWeather.preview,
            selection: .constant(DailyWeather.preview.first!)
        )
    }
}
