//
//  Date_Extension.swift
//  Hotel Booking
//
//  Created by PC_iOS on 05/06/23.
//

import Foundation

extension Date{
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day-1, to: startDate)!
        }
    }
    
    func extractData() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMYYYY"
        let date = formatter.string(from: self)
        return date
    }
    
    var onlyDate: Date {
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents)!
        }
    }
}
