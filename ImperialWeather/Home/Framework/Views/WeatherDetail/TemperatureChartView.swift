//
//  TemperatureChartView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 10/5/22.
//

import Charts
import SwiftUI

struct TemperatureChartView: View {
    @AppStorage("temperatureScale") private var scale: TemperatureScale = .celsius

    let dailyWeather: [DailyWeather]

    var body: some View {
        Chart(dailyWeather) { day in
            LineMark(
                x: .value(WeatherLabel.day, day.day, unit: .day),
                y: .value(
                    WeatherLabel.temperature,
                    scale == .celsius
                    ? day.plottableCelsius.primitivePlottable
                    : day.plottableFahrenheit.primitivePlottable
                )
            )
            .foregroundStyle(.secondary.opacity(0.5))
            .accessibilityHidden(true)
            .interpolationMethod(.catmullRom)

            PointMark(
                x: .value(WeatherLabel.day, day.day, unit: .day),
                y: .value(
                    WeatherLabel.temperature,
                    scale == .celsius
                    ? day.plottableCelsius.primitivePlottable
                    : day.plottableFahrenheit.primitivePlottable
                )
            )
            .accessibilityLabel(day.day.complete)
            .accessibilityValue(
                Text((scale == .celsius
                      ? day.plottableCelsius.measurement
                      : day.plottableFahrenheit.measurement
                     ).abbreviated
                )
            )
            .annotation(position: .overlay) {
                WeatherImage(systemName: day.icon)
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel( format: .dateTime.weekday(.narrow), centered: true)
            }
        }
        .chartYAxis {
            AxisMarks { value in
                AxisGridLine()
                AxisValueLabel {
                    switch scale {
                    case .celsius:
                        if let temperature = value.as(PlottableCelsius.self) {
                            Text(temperature.measurement.abbreviated)
                                .fontWeight(.medium)
                        }
                    case .fahrenheit:
                        if let temperature = value.as(PlottableFahrenheit.self) {
                            Text(temperature.measurement.abbreviated)
                                .fontWeight(.medium)
                        }
                    }
                }
            }
        }
        .chartYScale(domain: .automatic(includesZero: false))
    }
}

#Preview {
    TemperatureChartView(dailyWeather: .preview)
        .padding(.horizontal)
}
