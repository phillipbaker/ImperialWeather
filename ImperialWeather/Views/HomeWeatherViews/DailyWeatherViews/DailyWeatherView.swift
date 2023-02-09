//
//  DailyWeatherView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 6/29/21.
//

import SwiftUI

struct DailyWeatherView: View {
    let dailyWeather: [DailyWeather]
    @State private var detailPresented = false
    @State private var selection: DailyWeather?
    
    var body: some View {
        VStack(spacing: 12) {
            Text("7-Day Forecast")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.callout)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            
            ForEach(dailyWeather) { day in
                Divider()
                DailyWeatherRow(dailyWeather: day)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .sheet(isPresented: $detailPresented) {
                        WeatherDetailView (dailyWeather: dailyWeather, initialSelection: selection ?? dailyWeather.first!)
                    }
                    .onTapGesture {
                        selection = day
                        detailPresented = true
                    }
            }
        }
        .paneBackground()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(dailyWeather: DailyWeather.preview)
            .padding(.horizontal)
            .backgroundView()
    }
}
