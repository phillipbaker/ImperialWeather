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
                            HStack(spacing: 16) {
                                ForEach(dailyWeather) { dailyWeather in
                                    VStack(spacing: 8) {
                                        Text(dailyWeather.day.formatted(.dateTime.weekday()).uppercased())
                                            .foregroundColor(.secondary)
                                        
                                        ZStack {
                                            Circle()
                                                .opacity(dailyWeather == selection ? 1 : 0)
                                                .foregroundColor(Color.selectionBackground)
                                            Text(dailyWeather.day.formatted(.dateTime.day()))
                                                .foregroundColor(dailyWeather == selection ? .white : nil)
                                        }
                                        .frame(minWidth: 40, minHeight: 40)
                                    }
                                    .font(.callout)
                                    .onTapGesture {
                                        selection = dailyWeather
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        .paneBackground()
                        
                        HStack(spacing: 16) {
                            IconAndTemperatureView(icon: selection.icon, temperature: selection.temperature)
                            
                            Spacer()
                            
                            VStack {
                                Spacer()
                                TemperatureScalePicker()
                                    .frame(maxWidth: 124)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .paneBackground()
                        
                        
                        VStack(spacing: 16) {
                            Text("Daily Forecast")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.callout)
                                .textCase(.uppercase)
                                .foregroundColor(.secondary)

                            if #available(iOS 16.0, *) {
                                WeatherDetailChartView(dailyWeather: dailyWeather)
                                    .frame(minHeight: 320)
                            }

                            DataAttributionView()
                        }
                        .paneBackground()
                    }
                    .font(.system(.title2, design: .rounded))
                    .padding()
                    .onAppear {
                        value.scrollTo(selection.id)
                    }
                }
            }
            .backgroundView()
            .navigationTitle(selection.day.formatted(date: .complete, time: .omitted))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
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
