//
//  CalendarBody.swift
//  PillManager
//
//  Created by 박윤수 on 6/3/25.
//

import SwiftUI

struct CalendarBody: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    private let columns = Array(repeating: GridItem(.adaptive(minimum: 40)), count: 7)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(calendarViewModel.DatesToArray(from: calendarViewModel.currentMonth)) { value in
                if value.day != -1 {
                    Button(action: {}) {
                        Text("\(value.day)")
                            .font(Font.custom("나눔손글씨 꽃내음", size: 30))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                } else { Text("\(value.day)").hidden() }
            }
        }
        .padding()
    }
}

#Preview {
    CalendarBody(calendarViewModel: CalendarViewModel())
}
