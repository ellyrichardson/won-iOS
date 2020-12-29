//
//  DateUtils.swift
//  won-iOS
//
//  Created by Elly Richardson on 12/28/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import Foundation

class DateUtils {
    static func addDayToDate(date: Date, days: Double) -> Date {
        // Adds days (day * (60 * 60 * 24)) to the date that needs to increase
        return date.addingTimeInterval(days * (60.0 * 60.0 * 24.0))
    }
    
    static func daysBetweenTwoDates(earlyDate: Date, laterDate: Date) -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: earlyDate, to: laterDate).day!
    }
}
