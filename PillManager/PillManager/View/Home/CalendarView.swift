//
//  MainView.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI

struct _CalendarView: View {
    
    var body: some View {
            VStack{
                CalendarYearMonth()
                
                CalendarHeader()
                
                CalendarBodyView(calendarViewModel: CalendarViewModel())
            }
        }
}


#Preview {
    _CalendarView()
}
