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
    let initialSelection: DailyWeather
    @State private var selection: DailyWeather = DailyWeather.previewData[0]
    @Environment(\.presentationMode) var presentationMode
    
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
                            WeatherImageView(imageName: selection.description.first?.conditionName ?? WeatherIcon.dashedSquare)
                                .font(.system(size: 48))
                            
                            Divider()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                PrimaryTemperatureView(temperature: selection.temperature.max)
                                    .font(.largeTitle)
                                    .opacity(0.9)
                                
                                SecondaryTemperatureView(temperature: selection.temperature.max)
                            }
                            Spacer()
                            
                            VStack {
                                Spacer()
                                TemperatureScalePickerView()
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
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear {
            selection = initialSelection
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(dailyWeather: DailyWeather.previewData, initialSelection: DailyWeather.previewData[0])
    }
}
