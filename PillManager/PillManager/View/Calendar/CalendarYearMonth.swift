//
//  CalendarYearMonth.swift
//  PillManager
//
//  Created by 박윤수 on 6/3/25.
//

import SwiftUI

struct CalendarYearMonth: View {
    @ObservedObject var calendarViewModel: CalendarViewModel = CalendarViewModel()
    var body: some View {
        VStack{
            Button(action: {}){
                Text("\(calendarViewModel.getYearAndMonthString(currentDate: calendarViewModel.currentDate)[0]) \(calendarViewModel.getYearAndMonthString(currentDate: calendarViewModel.currentDate)[1])")
                    .font(Font.custom("나눔손글씨 맛있는체", size: 30))
                    .foregroundStyle(Color.black)
                    .padding()
            }
            
           
            
           
        }    }
}

#Preview {
    CalendarYearMonth()
}
