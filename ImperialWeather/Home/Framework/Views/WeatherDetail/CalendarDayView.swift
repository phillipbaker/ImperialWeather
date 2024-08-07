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
                .font(.subheadline)
                .textCase(.uppercase)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)

            ZStack {
                Circle()
                    .opacity(day == selection ? 1 : 0)
                    .foregroundStyle(.classicSelectionBackground)

                Text(day.day.date)
                    .fontWeight(day == selection ? .bold : .medium)
                    .accessibilityLabel(day.day.monthAndDay)
                    .foregroundStyle(day == selection ? .white : .primary)
                    .opacity(day == selection ? 1.0 : 0.9)
            }
            .frame(minWidth: 40, minHeight: 40)
        }
    }
}

#Preview {
    CalendarDayView(
        day: .todayPreview,
        selection: .constant(.tomorrowPreview)
    )
}
