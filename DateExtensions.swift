//
//  DateExtensions.swift
//  TaskManager
//
//  Created by Bera Bekir Baykal on 29.04.2024.
//

import SwiftUI

extension Date {
    func format(_ format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    // tarihin bugün olup olmadığını kontrol etmek
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    var isPast: Bool {
        Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    //verilen tarihe göre hafta getirme işlemi
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        guard (weekDate?.start) != nil else {
            return []
        }
        
        // tüm haftayı elde etmek için yapılan yineleme
        (0..<7).forEach { index in
            if let weekDay = calendar.date(byAdding: .day,value: index, to: startDate) {
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    //Creating next week, based on the last current week date
    func createNextWeek () -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        
        return fetchWeek(nextDate)
    }
    
    //Creating Previous week, based on the last current week date
    func createPreviousWeek () -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: -1, to: startOfLastDate) else {
            return []
        }
        
        return fetchWeek(nextDate)
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
