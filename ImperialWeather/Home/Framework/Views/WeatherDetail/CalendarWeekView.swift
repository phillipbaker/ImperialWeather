//
//  CalendarWeekView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 19/02/2024.
//

import SwiftUI

struct CalendarWeekView: View {
    let dailyWeather: [DailyWeather]
    @Binding var selection: DailyWeather
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(dailyWeather) { dailyWeather in
                        Button {
                            selection = dailyWeather
                        } label: {
                            CalendarDayView(
                                day: dailyWeather,
                                selection: $selection
                            )
                        }
                        .tint(.primary)
                        
                        if dailyWeather != self.dailyWeather.last {
                            VerticalSeparator()
                        }
                    }
                }
                .accessibilityLabel("Daily Forecast Picker")
                .onAppear {
                    value.scrollTo(selection.id, anchor: .center)
                }
            }
        }
    }
}

#Preview {
    CalendarWeekView(
        dailyWeather: .preview,
        selection: .constant(.todayPreview)
    )
}
