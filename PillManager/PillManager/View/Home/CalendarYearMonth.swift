//
//  CalendarYearMonth.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI

struct CalendarYearMonth: View {
    private let calendar = CalendarViewModel()

    var body: some View {
        Text("\(calendar.getYearAndMonthString(currentDate: calendar.currentDate)[0]) \(calendar.getYearAndMonthString(currentDate: calendar.currentDate)[1])")
            .font(.title)
            .fontWeight(.semibold)
            .padding()
    }
}

#Preview {
    CalendarYearMonth()
}
