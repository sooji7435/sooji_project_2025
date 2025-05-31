//
//  CalendarHeader.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI

struct CalendarHeader: View {
    private let weekDays: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        HStack {
            ForEach(weekDays, id: \.self) { day in
                Text(day)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(day == "일" ? Color.red : Color.black)
            }
        }
        .padding()
    }
}

#Preview {
    CalendarHeader()
}
