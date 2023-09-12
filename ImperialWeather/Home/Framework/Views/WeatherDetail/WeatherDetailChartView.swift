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
    @AppStorage("temperatureScale") private var temperatureScale: TemperatureScale = .celsius
    
    let dailyWeather: [DailyWeather]
    
    var body: some View {
        Chart(dailyWeather) { day in
            LineMark(
                x: .value(WeatherLabel.day, day.day, unit: .day),
                y: .value(
                    WeatherLabel.temperature,
                    temperatureScale == .celsius ? day.plottableCelsius : day.plottableFahrenheit
                )
            )
            .foregroundStyle(Color.secondary.opacity(0.5))
            .accessibilityHidden(true)
            .interpolationMethod(.catmullRom)

            PointMark(
                x: .value(WeatherLabel.day, day.day, unit: .day),
                y: .value(WeatherLabel.temperature, temperatureScale == .celsius ? day.plottableCelsius : day.plottableFahrenheit)
            )
            .accessibilityLabel(day.day.complete)
            .accessibilityValue(
                Text((temperatureScale == .celsius ? day.plottableCelsius : day.plottableFahrenheit)
                    .measurement,
                     format: .measurement(
                        width: .abbreviated,
                        numberFormatStyle: .number.precision(.fractionLength(0))
                     )
                )
            )
            .annotation(position: .overlay) {
                WeatherImage(systemName: day.icon)
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
            AxisMarks { value in
                if let temperature = value.as(PlottableMeasurement.self) {
                    AxisGridLine()
                    AxisValueLabel {
                        Text(temperature.measurement,
                             format: .measurement(
                                width: .abbreviated,
                                usage: .asProvided,
                                numberFormatStyle: .number.precision(.fractionLength(0))
                             )
                        )
                        .foregroundColor(.gray)
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
        WeatherDetailChartView(dailyWeather: DailyWeather.preview)
            .padding(.horizontal)
    }
}
