//
//  Date+Extension.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import Foundation

extension Date {
    
    enum DateFormat: String {
        case full = "yyyy-MM-ddThh:mm:ss"
        case date = "yyyy-MM-dd"
        case twelveHourTime = "hh:mm a"
        case birthDate = "dd.MM.yyyy"
    }
    
    static func formatter(format: DateFormat) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter
    }

    func toString(format: DateFormat) -> String {
        let formatter = Date.formatter(format: format)
        return formatter.string(from: self)
    }
    
    func convertToTimeZone(_ targetTimeZone: TimeZone) -> Date {
        let delta = TimeInterval(targetTimeZone.secondsFromGMT(for: self) - TimeZone.current.secondsFromGMT(for: self))
        return addingTimeInterval(delta)
    }
    
    func daysBefore(_ days: Int) -> Date {
        let calendar = Calendar.current
        guard let date = calendar.date(byAdding: .day, value: -days, to: self) else {
            return self
        }
        return date
    }
    
    func convertToFormat(_ format: DateFormat) -> Date? {
        let formatter = Self.formatter(format: format)
        let string = formatter.string(from: self)
        return formatter.date(from: string)
    }
}
