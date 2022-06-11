//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI

struct DailyWeatherView: View {
    var dailyWeather: [DailyWeather]
    
    var body: some View {
        VStack(spacing: 12) {
            Text("7-Day Forecast")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            
            ForEach(dailyWeather) { day in
                Divider()
                DailyWeatherRow(day: day)
            }
        }
        .paneBackground()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(dailyWeather: PreviewData.daily)
            .padding(.horizontal)
            .backgroundView()
    }
}
