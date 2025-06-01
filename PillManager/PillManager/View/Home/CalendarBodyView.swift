//
//  CalendarBodyView.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI


struct CalendarBodyView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        // 달력 그리드
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(calendarViewModel.DatesToArray(from: calendarViewModel.currentMonth)) { value in
                Button(action: {}) {
                    Text("\(value.day)")
                        .font(.title2)
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
