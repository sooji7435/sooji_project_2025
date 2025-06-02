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
        Button(action: {}){
            Text("\(calendar.getYearAndMonthString(currentDate: calendar.currentDate)[0]) \(calendar.getYearAndMonthString(currentDate: calendar.currentDate)[1])")
                .font(Font.custom("나눔손글씨 맛있는체", size: 30))
                .foregroundStyle(Color.black)
                .padding()
        }
            
    }
}

#Preview {
    CalendarYearMonth()
}
