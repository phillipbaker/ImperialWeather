//
//  WeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/10/22.
//

import SwiftUI

struct WeatherView: View {
    let weather: HomeWeather
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let layout = horizontalSizeClassIsCompact
        ? AnyLayout(VStackLayout(spacing: 16))
        : AnyLayout(HStackLayout(alignment: .top, spacing: 16))

        ScrollView(.vertical) {
            layout {
                CurrentWeatherView(weather: weather.current)

                VStack(spacing: 16) {
                    HourlyWeatherView(hourlyWeather: weather.hourly)

                    DailyWeatherView(dailyWeather: weather.daily)
                }

            }
            .padding()

            DataAttributionView()
                .padding(.horizontal)
                .padding(.horizontal)
        }
    }

    private var horizontalSizeClassIsCompact: Bool {
        return horizontalSizeClass == .compact
    }
}

#Preview {
    WeatherView(weather: .preview)
        .backgroundView()
}
