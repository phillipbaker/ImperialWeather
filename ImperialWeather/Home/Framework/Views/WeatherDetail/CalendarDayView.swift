//
//  CalendarDayView.swift
//  ImperialWeather
//
//  Created by Phillip Baker on 19/02/2024.
//

import SwiftUI

struct CalendarDayView: View {
    let day: DailyWeather
    @Binding var selection: DailyWeather
    
    var body: some View {
        VStack(spacing: 8) {
            Text(day.day.weekday)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            ZStack {
                Circle()
                    .opacity(day == selection ? 1 : 0)
                    .foregroundColor(Color.selectionBackground)
                Text(day.day.date)
                    .accessibilityLabel(day.day.monthAndDay)
                    .foregroundColor(day == selection ? .white : nil)
            }
            .frame(minWidth: 40, minHeight: 40)
        }
        .tint(.primary)
        .font(.callout)
    }
}

#Preview {
    CalendarDayView(
        day: .preview_today,
        selection: .constant(.preview_tomorrow)
    )
}
