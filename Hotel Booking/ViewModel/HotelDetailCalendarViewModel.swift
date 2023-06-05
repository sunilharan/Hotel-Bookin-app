//
//  HotelDetailCalendarViewModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 03/06/23.
//

import Foundation
import SwiftUI
import Combine
import MapKit

final class HotelDetailCalendarViewModel: ObservableObject {
    
    @Published var adult_counter: Int = 0
    @Published var children_counter: Int = 0
    @Published var currentDate : Date = Date()
    @Published var currentMonth : Int = 0
    @Published var startDate : Date = Date()
    @Published var endDate : Date = Date()
    
    let days : [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]

    init() {
        startDate = Date()
        endDate = Date()
        currentDate = Date()
        setupStartAndEndDate(date: Date())
    }
    
    func addAdult(){
        adult_counter += 1
    }
    
    func minusAdult(){
        if adult_counter != 0{
            adult_counter -= 1
        }
    }
    
    func addChildren(){
        children_counter += 1
    }
    
    func minusChildren(){
        if children_counter != 0{
            children_counter -= 1
        }
    }
    
    func clearAll(){
        adult_counter = 0
        children_counter = 0
    }
    
    func previousMonth(){
        currentMonth -= 1
    }
    
    func nextMonth(){
        currentMonth += 1
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool{
        let calander = Calendar.current
        return calander.isDate(date1, inSameDayAs: date2)
    }
    
    func isDateBetweenStartAndEndDate(date: Date) -> Bool{
        if startDate.onlyDate == date.onlyDate && endDate.onlyDate == date.onlyDate{
            return true
        } else if startDate.onlyDate <= date.onlyDate && endDate.onlyDate >= date.onlyDate{
            return true
        }
        return false
    }
    
    func setupStartAndEndDate(date: Date){
        if startDate.onlyDate == date.onlyDate && endDate.onlyDate == date.onlyDate{
            startDate = date
            endDate = date
        } else if endDate.onlyDate > date.onlyDate && startDate.onlyDate < date.onlyDate{
            startDate = date
            endDate = date
        } else if date.onlyDate <= endDate.onlyDate{
            startDate = date
        } else if date.onlyDate >= startDate.onlyDate{
            endDate = date
        }
    }
    
    func extractData() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM, YYYY"
        let date = formatter.string(from: currentDate)
        return date
    }
    
    func extractSelectedDateString() -> String{
        let formatter1 = DateFormatter()

        if startDate.extractData() == endDate.extractData(){
            formatter1.dateFormat = "MMMM dd, YYYY"
            let date = formatter1.string(from: startDate)
            return date
        } else {
            formatter1.dateFormat = "MMMM dd - "
            let date1 = formatter1.string(from: startDate)
            
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "MMMM dd, YYYY"
            let date2 = formatter2.string(from: endDate)
            return date1 + date2
        }
    }
    
    func getCurrentMonth() -> Date{
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

