//
//  CalendarBodyView.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI


struct CalendarBodyView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    private let columns = Array(repeating: GridItem(.adaptive(minimum: 40)), count: 7)

    
    var body: some View {
        // 달력 그리드
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(calendarViewModel.DatesToArray(from: calendarViewModel.currentMonth)) { value in
                Button(action: {}) {
                        Text("\(value.day)")
                        .font(Font.custom("나눔손글씨 꽃내음", size: 30))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    CalendarBodyView(calendarViewModel: CalendarViewModel())
}
