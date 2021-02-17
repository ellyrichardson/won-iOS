//
//  WantNotificationsManager.swift
//  won-iOS
//
//  Created by Elly Richardson on 2/14/21.
//  Copyright © 2021 EllyRichardson. All rights reserved.
//

import UserNotifications

class WantNotificationsManager {
    private static let THIRTY_DAYS = 30.0
    
    static func scheduleNotificationFromWant(want: Want) {
        let content = UNMutableNotificationContent()
        content.subtitle = want.getName() + " is due in " + String(want.getDaysLeft()) + " days"
        content.sound = UNNotificationSound.default
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: retrieveDateComponentForWantDaysLeft(notifDaysLeft: want.getNotification()!.getDaysLeft()), repeats: (want.getNotification()?.isRepeating())!)
        
        let request = UNNotificationRequest(identifier: want.getId(), content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    private static func retrieveDateComponentForWantDaysLeft(notifDaysLeft: Int) -> DateComponents {
        let daysToNotify = THIRTY_DAYS - Double(notifDaysLeft)
        let wantDueDate = DateUtils.addDayToDate(date: Date(), days: daysToNotify)
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = calendar.component(.month, from: wantDueDate)
        dateComponents.day = calendar.component(.day, from: wantDueDate)
        dateComponents.hour = calendar.component(.hour, from: wantDueDate)
        dateComponents.year = calendar.component(.year, from: wantDueDate)
        return dateComponents
    }
    
    // Removes notification based on the target Want
    static func removeNotificationByWantId(wantId: String) {
        var wantNotifs = [String]()
        wantNotifs.append(wantId)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: wantNotifs)
    }
}
