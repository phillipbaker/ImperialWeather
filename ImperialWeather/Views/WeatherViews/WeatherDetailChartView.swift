//
//  WeatherDetailChartView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/5/22.
//

import Charts
import SwiftUI

@available(iOS 16.0, *)
struct WeatherDetailChartView: View {
    let dailyWeather: [DailyWeather]
    
    var body: some View {
        Chart(dailyWeather) { day in
            LineMark(
                x: .value("Day", day.day, unit: .day),
                y: .value("Temperature", day.temperature.max)
            )
            .interpolationMethod(.catmullRom)
            
            PointMark(
                x: .value("Day", day.day, unit: .day),
                y: .value("Temperature", day.temperature.max)
            )
            .annotation(position: .bottom, spacing: 16) {
                Text("\(day.temperature.max, format: .number.precision(.significantDigits(2)))")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .accessibilityLabel("\(day.day)")
            .accessibilityValue("\(day.temperature.max) degrees celsius")
            
            PointMark(
                x: .value("Day", day.day, unit: .day),
                y: .value("Temperature", day.temperature.max)
            )
            .annotation(position: .overlay) {
                WeatherImageView(imageName: day.description[0].conditionName)
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day)) { value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(
                    format: .dateTime.weekday(.narrow),
                    centered: true
                )
            }
        }
        .chartYAxis {
            AxisMarks(values: .stride(by: 1.0)) { value in
                if let temp = value.as(Double.self) {
                    AxisGridLine()
                    AxisValueLabel {
                        Text("\(temp, format: .number.precision(.significantDigits(2)))")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .chartYScale(domain: .automatic(includesZero: false))
    }
}

@available(iOS 16.0, *)
struct WeatherDetailChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailChartView(dailyWeather: DailyWeather.previewData)
            .padding(.horizontal)
    }
}
