//
//  Calender.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var currentDate: Date = Date()
    @Published var currentMonth: Int = 0
    
    struct DateInfo: Identifiable {
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
    func DatesToArray(from currentMonth: Int) -> [DateInfo] {
        let calendar = Calendar.current
        
        //getCurrnetMonth 반환값 저장
        let currentMonth = getCurrnetMonth(addingMonth: currentMonth)
        
        //currnetMonth에 저장되어있는 "달"의 모든 "일"들을 배열로 변환하여 저장
        //compactMap은 Map 함수의 일종으로 Map 함수를 사용하면 배열의 원소들이 옵셔널로 저장되는데 옵셔널을 벗기고, nil 값들을 제거하여 배열을 반환함
        var days = currentMonth.getAllDates().compactMap { date -> DateInfo in
            //calendar타입의 component 메서드는 날짜를 구성하는 구성요소(년, 월, 일, 시간 등) 얻고 싶은 하나의 요소를 정수형으로 리턴
            //
            let day = calendar.component(.day, from: date)
            
            return DateInfo(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0 ..< firstWeekday - 1 {
            days.insert(DateInfo(day: -1, date: Date()), at: 0)
        }
        return days
    }
}


extension Date {
   // 현재 월의 날짜를 Date 배열로 만들어주는 함수
   func getAllDates() -> [Date] {
       // 현재날짜 캘린더 가져오는거
       let calendar = Calendar.current
       // 현재 월의 첫 날(startDate) 구하기 -> 일자를 지정하지 않고 year와 month만 구하기 때문에 그 해, 그 달의 첫날을 이렇게 구할 수 있음
       let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
       // 현재 월(해당 월)의 일자 범위(날짜 수 가져오는거)
       let range = calendar.range(of: .day, in: .month, for: startDate)!
       // range의 각각의 날짜(day)를 Date로 맵핑해서 배열로!!
       return range.compactMap { day -> Date in
           // to: (현재 날짜, 일자)에 day를 더해서 새로운 날짜를 만듦
           calendar.date(byAdding: .day, value: day - 1, to: startDate) ?? Date()
       }
   }
}


