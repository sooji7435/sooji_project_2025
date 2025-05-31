//
//  Calender.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import Foundation

class CalendarViewModel {
    @Published var currentDate: Date = Date()
    @Published var currentMonth: Int = 0
    
    struct DateInfo {
        var id: String = UUID().uuidString
        var day: Int
        var date: Date
    }
    
    // 달력 최상단 년과 월을 얻는 함수
    func getYearAndMonthString(currentDate: Date) -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월"
        formatter.locale = .autoupdatingCurrent
        let date: String = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    //"월"을 구하는 함수
    
    func getCurrnetMonth(addingMonth: Int) -> Date {
        let calendar = Calendar.current
        
        //현재 날짜의 "월"에 addingMonth 를 더해서 새로운 "월"을 반환
        // ex) 5월 31일 -> 7월 31일
        guard let currentMonth = calendar.date(
            byAdding: .month, // 달을 더한다.
            value: addingMonth, // addingMont 값을.
            to: currentDate // Date()에 즉 현재 날짜에
        ) else { return currentDate }
        
        return currentMonth
    }
    
    // 해당 월의 모든 날짜들을 배열에 저장 -> 배열에 저장해야 Grid로 보여주기 가능
    func extractDates(from currentMonth: Date) -> [DateInfo] {
        let calendar = Calendar.current
        
        let currentMonth = getCurrnetMonth(addingMonth: currentMonth)
        
    }
    
}


